# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviePerson, type: :model do
  context 'validates presence of' do
    it { should validate_presence_of(:role) }
  end

  context 'associations' do
    it { should belong_to(:movie) }
    it { should belong_to(:person) }
  end
end
