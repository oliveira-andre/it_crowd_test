# frozen_string_literal: true

module Api
  module V1
    class PeopleController < ApplicationController
      def create
        serializer(
          People::Create.new(create_person_params).fetch_and_validate
        )
      end

      private

      def create_person_params
        params.require(:person).permit(
          :first_name, :last_name, :email, :password, :aliases
        )
      end
    end
  end
end
