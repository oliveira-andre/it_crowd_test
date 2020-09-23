# frozen_string_literal: true

class Movie < ApplicationRecord
  include ConvertToRoman

  validates_presence_of :title, :released_at

  has_many :movie_people
  has_many :people, through: :movie_people

  accepts_nested_attributes_for :movie_people

  def release_year
    roman(released_at.year)
  end

  def cascating
    people.joins(:movie_people).where(movie_people: { role: :actors })
          .select('movie_people.id as movie_person_id', 'people.*')
  end

  def directors
    people.joins(:movie_people).where(movie_people: { role: :director })
          .select('movie_people.id as movie_person_id', 'people.*')
  end

  def producers
    people.joins(:movie_people).where(movie_people: { role: :producer })
          .select('movie_people.id as movie_person_id', 'people.*')
  end
end
