# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    first_name { FFaker::Internet.user_name }
    last_name { FFaker::Internet.user_name }
    email { "#{FFaker::Internet.domain_word}@gmail.com" }
    password { FFaker::Internet.password }

    trait :actors do
      after(:create) do |person|
        create(:movie_person_actors, movie: person)
      end
    end

    trait :director do
      after(:create) do |person|
        create(:movie_person_director, movie: person)
      end
    end

    trait :producer do
      after(:create) do |person|
        create(:movie_person_producer, movie: person)
      end
    end

    factory :movie_as_actors, traits: %i[actors]
    factory :movie_as_director, traits: %i[director]
    factory :movie_as_producer, traits: %i[producer]
  end
end
