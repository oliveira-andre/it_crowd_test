# frozen_string_literal: true

module Api
  module V1
    module Movies
      class Show < ApplicationValidator
        def fetch
          { data: movie, serializer: serializer, status: 200 }
        end

        private

        def serializer
          MoviesSerializer
        end

        def movie
          Movie.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          raise ServiceException.new, I18n.t('errors.not_found')
        end
      end
    end
  end
end
