# frozen_string_literal: true

module Api
  module V1
    class PeopleSerializer < ApplicationSerializer
      def serialize
        return attributes(data) unless data.respond_to?('map')

        data.map { |data| attributes(data) }.compact
      end

      def attributes(data)
        {
          first_name: data.first_name,
          last_name: data.last_name,
          email: data.email,
          movies_as_actors: movies_as_actors(data.movies_as_actors),
          movies_as_director: movies_as_director(data.movies_as_director),
          movies_as_producer: movies_as_producer(data.movies_as_producer)
        }.compact
      end

      def movies_as_actors(movies_as_actors)
        return if movies_as_actors.empty?

        movies_as_actors.map do |movie|
          {
            title: movie.title,
            release_year: movie.release_year,
            role: :actors
          }.compact
        end
      end

      def movies_as_director(movies_as_director)
        return if movies_as_director.empty?

        movies_as_director.map do |movie|
          {
            title: movie.title,
            release_year: movie.release_year,
            role: :director
          }.compact
        end
      end

      def movies_as_producer(movies_as_producer)
        return if movies_as_producer.empty?

        movies_as_producer.map do |movie|
          {
            title: movie.title,
            release_year: movie.release_year,
            role: :producer
          }.compact
        end
      end
    end
  end
end
