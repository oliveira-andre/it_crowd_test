# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'People Management', type: :request do
  context :create do
    let(:current_path) { '/api/v1/people' }
    subject { post current_path, params: params }

    context 'invalid params' do
      let(:params) { { person: { first_name: '' } } }
      before { subject }

      it { expect(response).to have_http_status(422) }
      it do
        expect(parsed_response['errors']).to eq(
          I18n.t('errors.invalid_params')
        )
      end
    end
  end
end
