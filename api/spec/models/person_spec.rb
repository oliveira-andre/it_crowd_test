# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validates presence of' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end

  context 'associations' do
    it { should have_many(:movie_people) }
    it { should have_many(:movies).through(:movie_people) }
  end
end
