# frozen_string_literal: true

module Api
  module V1
    module Movies
      class Update < ApplicationValidator
        def fetch_and_validate
          { data: movie, serializer: serializer, status: 202 }
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
            update_movie!
            params[:movie_people_attributes].each do |movie_people_param|
              create_or_update_movie_people(movie_people_param)
            end
          end
        rescue ArgumentError
          raise ServiceException.new, I18n.t('errors.invalid_params')
        end

        def update_movie!
          @movie = Movie.find(params[:movie_id])
          @movie.update!(
            title: params[:title], released_at: params[:released_at]
          )
        rescue ActiveRecord::RecordNotFound
          raise ServiceException.new, I18n.t('errors.not_found')
        rescue ActiveRecord::RecordInvalid
          raise ServiceException.new, I18n.t('errors.invalid_params')
        end

        def create_or_update_movie_people(movie_people_param)
          if movie_people_param[:id]
            update_movie_people!(movie_people_param)
          else
            create_movie_people!(movie_people_param)
          end
        end

        def update_movie_people!(movie_people_param)
          @movie.movie_people.find(movie_people_param[:id]).update!(
            role: movie_people_param[:role],
            person_id: movie_people_param[:person_id], movie_id: @movie.id
          )
        rescue ActiveRecord::RecordNotFound
          raise ServiceException.new, I18n.t('errors.not_found')
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
