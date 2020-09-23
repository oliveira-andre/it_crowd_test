# frozen_string_literal: true

class Movie < ApplicationRecord
  validates_presence_of :title

  has_many :movie_people
  has_many :people, through: :movie_people

  def cascating
    people.joins(:movie_people).where(movie_people: { role: :actors })
  end

  def directors
    people.joins(:movie_people).where(movie_people: { role: :director })
  end

  def producers
    people.joins(:movie_people).where(movie_people: { role: :producer })
  end
end
