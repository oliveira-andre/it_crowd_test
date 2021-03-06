# frozen_string_literal: true

EMAIL_VALIDATOR = /\A[\w]+@[a-z]+\.[a-z]+\z/.freeze

ROMAN_NUMBERS = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I',
  0 => ''
}.freeze

JWT_SECRET = ENV['jwt_secret'] || 'secret'
