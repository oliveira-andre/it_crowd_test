# frozen_string_literal: true

module Api
  module V1
    module Movies
      class Index < ApplicationValidator
        def fetch
          { data: load_movies, serializer: MoviesSerializer, status: 200 }
        end

        private

        def load_movies
          Movie.all
        end
      end
    end
  end
end
