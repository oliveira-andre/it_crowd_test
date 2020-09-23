# frozen_string_literal: true

module Api
  module V1
    module People
      class Show < ApplicationValidator
        def fetch
          { data: person, serializer: serializer, status: 200 }
        end

        private

        def serializer
          PeopleSerializer
        end

        def person
          Person.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          raise ServiceException.new, I18n.t('errors.not_found')
        end
      end
    end
  end
end
