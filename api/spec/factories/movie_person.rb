# frozen_string_literal: true

FactoryBot.define do
  factory :movie_person do
    movie
    person

    trait :actors do
      role { :actors }
    end

    trait :director do
      role { :director }
    end

    trait :producer do
      role { :producer }
    end

    factory :movie_person_actors, traits: %i[actors]
    factory :movie_person_director, traits: %i[director]
    factory :movie_person_producer, traits: %i[producer]
  end
end
