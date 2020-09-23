# frozen_string_literal: true

class MoviePerson < ApplicationRecord
  enum role: { actors: 0, director: 1, producer: 2 }

  validates_presence_of :role

  belongs_to :movie
  belongs_to :person
end
