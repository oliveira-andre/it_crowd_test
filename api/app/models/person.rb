# frozen_string_literal: true

class Person < ApplicationRecord
  include BCrypt

  attr_reader :password
  has_secure_password

  validates_presence_of :first_name, :last_name, :email, :password_digest
  validates_uniqueness_of :email
  validates :email, format: { with: EMAIL_VALIDATOR }
  validates :password, length: { minimum: 6 }

  has_many :movie_people
  has_many :movies, through: :movie_people

  def password=(value)
    self.password_digest = Password.create(value)
    @password = value
  end

  def valid_password?(password)
    Password.new(password_digest) == password
  end

  def token
    JWT.encode(
      { data: id, exp: (Time.zone.now + 4.hours).to_i },
      JWT_SECRET, 'HS256'
    )
  end

  def movies_as_actors
    movies.joins(:movie_people).where(movie_people: { role: :actors })
  end

  def movies_as_director
    movies.joins(:movie_people).where(movie_people: { role: :director })
  end

  def movies_as_producer
    movies.joins(:movie_people).where(movie_people: { role: :producer })
  end
end
