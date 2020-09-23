# frozen_string_literal: true

module ConvertToRoman
  # i got this code by stack overflow https://codereview.stackexchange.com/questions/7937/roman-numeral-converter
  # coz i didn't know how roman numbers works, but reading this code i learned it
  def roman(year)
    return '' if year.zero?

    ROMAN_NUMBERS.each do |value, letter|
      return (letter * (year / value)) << roman(year % value) if value <= year
    end

    roman(year % value)
  end
end
