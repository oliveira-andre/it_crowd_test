# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'validates presence of' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:released_at) }
  end

  context 'associations' do
    it { should have_many(:movie_people) }
    it { should have_many(:people).through(:movie_people) }
  end
end
