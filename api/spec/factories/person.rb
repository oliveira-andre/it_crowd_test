# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    first_name { FFaker::Internet.user_name }
    last_name { FFaker::Internet.user_name }
    email { FFaker::Internet.disposable_email }
    password { FFaker::Internet.password }

    trait :actors do
      after(:create) do |movie|
        create(:movie_person_actors, movie: movie)
      end
    end

    factory :movie_as_actors, traits: %i[actors]
  end
end
