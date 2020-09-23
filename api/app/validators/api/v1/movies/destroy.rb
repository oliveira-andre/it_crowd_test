# frozen_string_literal: true

module Api
  module V1
    module Movies
      class Destroy < ApplicationValidator
        def fetch_and_destroy
          fetch
          destroy
          { data: {}, serializer: MoviesSerializer, status: 204 }
        end

        private

        def fetch
          @movie ||= Movie.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          raise ServiceException.new, I18n.t('errors.not_found')
        end

        def destroy
          destroy_movie_people! if @movie.movie_people.present?

          @movie.destroy!
        rescue ActiveRecord::RecordNotDestroyed
          raise ServiceException.new, I18n.t('errors.not_destroyed')
        rescue ActiveRecord::InvalidForeignKey
          raise ServiceException.new, I18n.t('errors.not_destroyed')
        end

        def destroy_movie_people!
          @movie.movie_people.each(&:destroy!)
        rescue ActiveRecord::RecordNotDestroyed
          raise ServiceException.new, I18n.t('errors.not_destroyed')
        end
      end
    end
  end
end
