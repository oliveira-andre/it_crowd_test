# frozen_string_literal: true

module Api
  module V1
    module People
      class Update < ApplicationValidator
        def fetch_and_validate
          { data: fetch, serializer: serializer, status: 202 }
        end

        private

        def serializer
          PeopleSerializer
        end

        def fetch
          person
          update
          @person
        end

        def person
          @person ||= Person.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          raise ServiceException.new, I18n.t('errors.not_found')
        end

        def update
          person.update!(params.except(:id))
        rescue ActiveRecord::RecordInvalid
          raise ServiceException.new, I18n.t('errors.invalid_params')
        end
      end
    end
  end
end
