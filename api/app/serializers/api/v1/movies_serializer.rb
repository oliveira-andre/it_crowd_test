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
          id: data.id,
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
            movie_person_id: person.movie_person_id,
            first_name: person.first_name,
            last_name: person.last_name,
            email: person.email
          }.compact
        end
      end

      def directors(directors)
        return if directors.empty?

        directors.map do |person|
          {
            movie_person_id: person.movie_person_id,
            first_name: person.first_name,
            last_name: person.last_name,
            email: person.email
          }.compact
        end
      end

      def producers(producers)
        return if producers.empty?

        producers.map do |person|
          {
            movie_person_id: person.movie_person_id,
            first_name: person.first_name,
            last_name: person.last_name,
            email: person.email
          }.compact
        end
      end
    end
  end
end
