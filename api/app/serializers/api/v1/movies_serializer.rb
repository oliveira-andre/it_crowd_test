# frozen_string_literal: true

module Api
  module V1
    class MoviesSerializer < ApplicationSerializer
      def serialize
        return attributes(data) unless data.respond_to?('map')

        data.map { |data| attributes(data) }.compact
      end

      def attributes(data)
        {
          title: data.title,
          release_year: data.release_year,
          cascating: cascating(data.cascating),
          directors: directors(data.directors),
          producers: producers(data.producers)
        }.compact
      end

      def cascating(cascatings)
        return if cascatings.empty?

        cascatings.map do |person|
          {
            first_name: person.first_name,
            last_name: person.last_name,
            email: person.email,
            role: :actors
          }.compact
        end
      end

      def directors(directors)
        return if directors.empty?

        directors.map do |person|
          {
            first_name: person.first_name,
            last_name: person.last_name,
            email: person.email,
            role: :director
          }.compact
        end
      end

      def producers(producers)
        return if producers.empty?

        producers.map do |person|
          {
            first_name: person.first_name,
            last_name: person.last_name,
            email: person.email,
            role: :producer
          }.compact
        end
      end
    end
  end
end
