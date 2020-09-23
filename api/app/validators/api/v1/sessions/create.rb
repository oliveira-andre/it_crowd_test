# frozen_string_literal: true

module Api
  module V1
    module Sessions
      class Create < ApplicationValidator
        def fetch_and_validate
          fetch
          validate
          { data: @person, serializer: serializer, status: 201 }
        end

        private

        def fetch
          @person ||= Person.find_by(email: params[:email])
          return if @person

          raise ServiceException.new, I18n.t('errors.not_found')
        end

        def validate
          return if @person.valid_password?(params[:password])

          raise ServiceException.new, I18n.t('errors.invalid_params')
        end

        def serializer
          SessionsSerializer
        end
      end
    end
  end
end
