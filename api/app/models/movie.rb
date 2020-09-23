# frozen_string_literal: true

class Movie < ApplicationRecord
  include ConvertToRoman

  validates_presence_of :title, :released_at

  has_many :movie_people
  has_many :people, through: :movie_people

  def release_year
    roman(released_at.year)
  end

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
