# frozen_string_literal: true

module Api
  module V1
    module Movies
      class Index < ApplicationValidator
        def fetch
          { data: load_movies, serializer: serializer, status: 200 }
        end

        private

        def serializer
          MoviesSerializer
        end

        def load_movies
          Movie.all
        end
      end
    end
  end
end
