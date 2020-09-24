# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { FFaker::Lorem.word }
    released_at { FFaker::Time.between(1.year.ago, 10.years.ago) }
  end
end
