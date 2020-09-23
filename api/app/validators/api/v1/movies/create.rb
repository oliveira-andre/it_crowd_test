# frozen_string_literal: true

module Api
  module V1
    module Movies
      class Create < ApplicationValidator
        def fetch_and_validate
          { data: movie, serializer: serializer, status: 201 }
        end

        private

        def serializer
          MoviesSerializer
        end

        def movie
          movie_transaction
          @movie
        end

        def movie_transaction
          Movie.transaction do
            create_movie!
            return unless params[:movie_people_attributes]

            params[:movie_people_attributes].each do |movie_people_param|
              create_movie_people!(movie_people_param)
            end
          end
        rescue ArgumentError
          raise ServiceException.new, I18n.t('errors.invalid_params')
        end

        def create_movie!
          @movie = Movie.create!(
            title: params[:title], released_at: params[:released_at]
          )
        rescue ActiveRecord::RecordInvalid
          raise ServiceException.new, I18n.t('errors.invalid_params')
        end

        def create_movie_people!(movie_people_param)
          MoviePerson.create!(
            role: movie_people_param[:role],
            person_id: movie_people_param[:person_id], movie_id: @movie.id
          )
        rescue ActiveRecord::RecordInvalid
          raise ServiceException.new, I18n.t('errors.invalid_params')
        end
      end
    end
  end
end
