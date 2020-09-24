# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie Management', type: :request do
  context :index do
    let(:current_path) { '/api/v1/movies' }
    let!(:movie) { create(:movie) }

    subject { get current_path }
    before { subject }

    it { expect(response).to have_http_status(200) }
    it { expect(parsed_response.present?).to be_truthy }
  end

  context :create do
    let(:current_path) { '/api/v1/movies' }
    subject { post current_path, params: params, headers: headers }

    context 'invalid headers' do
      let(:headers) { { 'authorization' => '' } }
      let(:params) { { movie: { title: '' } } }

      before { subject }

      it { expect(response).to have_http_status(422) }
      it do
        expect(parsed_response['errors']).to eq(I18n.t('errors.invalid_token'))
      end
    end

    context 'valid headers' do
      let(:person) { create(:person) }
      let(:headers) { { 'authorization' => person.token } }

      context 'invalid params' do
        let(:params) { { movie: { title: '' } } }
        before { subject }

        it { expect(response).to have_http_status(422) }
        it do
          expect(parsed_response['errors']).to eq(
            I18n.t('errors.invalid_params')
          )
        end
      end

      context 'valid params' do
        let(:params) { { movie: attributes_for(:movie) } }
        before { subject }

        it { expect(response).to have_http_status(201) }
        it { expect(parsed_response.present?).to be_truthy }
      end
    end
  end

  context :update do
    let(:movie_person) { create(:movie_person) }
    let(:movie) { movie_person.movie }
    let(:current_path) { "/api/v1/movies/#{movie.id}" }
    subject { put current_path, params: params, headers: headers }

    context 'invalid headers' do
      let(:headers) { { 'authorization' => '' } }
      let(:params) { { movie: { title: '' } } }

      before { subject }

      it { expect(response).to have_http_status(422) }
      it do
        expect(parsed_response['errors']).to eq(I18n.t('errors.invalid_token'))
      end
    end

    context 'valid headers' do
      let(:headers) { { 'authorization' => movie_person.person.token } }

      context 'invalid params' do
        let(:params) { { movie: { title: '' } } }
        before { subject }

        it { expect(response).to have_http_status(422) }
        it do
          expect(parsed_response['errors']).to eq(
            I18n.t('errors.invalid_params')
          )
        end
      end

      context 'valid params' do
        let(:params) { { movie: attributes_for(:movie) } }
        before { subject }

        it { expect(response).to have_http_status(202) }
        it { expect(parsed_response.present?).to be_truthy }
      end
    end
  end

  context :destroy do
    let(:movie_person) { create(:movie_person) }
    let(:movie) { movie_person.movie }
    let(:current_path) { "/api/v1/movies/#{movie.id}" }
    subject { delete current_path, headers: headers }

    context 'invalid headers' do
      let(:headers) { { 'authorization' => '' } }
      before { subject }

      it { expect(response).to have_http_status(422) }
      it do
        expect(parsed_response['errors']).to eq(I18n.t('errors.invalid_token'))
      end
    end

    context 'valid headers' do
      let(:headers) { { 'authorization' => movie_person.person.token } }

      context 'user not exist' do
        let(:current_path) { '/api/v1/movies/any' }
        before { subject }

        it { expect(response).to have_http_status(422) }
        it do
          expect(parsed_response['errors']).to eq(I18n.t('errors.not_found'))
        end
      end

      context 'user exist' do
        before { subject }

        it { expect(response).to have_http_status(204) }
      end
    end
  end
end
