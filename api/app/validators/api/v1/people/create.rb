# frozen_string_literal: true

module Api
  module V1
    module People
      class Create < ApplicationValidator
        def fetch_and_validate
          { data: person, serializer: serializer, status: 201 }
        end

        private

        def serializer
          PeopleSerializer
        end

        def person
          Person.create!(params)
        rescue ActiveRecord::RecordInvalid
          raise ServiceException.new, I18n.t('errors.invalid_params')
        end
      end
    end
  end
end
