# frozen_string_literal: true

module Api
  module V1
    class PeopleController < ApplicationController
      before_action :load_people

      def index
        serializer(index_people_params)
      end

      def create
        serializer(
          People::Create.new(create_person_params).fetch_and_validate
        )
      end

      private

      def load_people
        @people = Person.all
      end

      def index_people_params
        { data: @people, serializer: PeopleSerializer, status: 200 }
      end

      def create_person_params
        params.require(:person).permit(
          :first_name, :last_name, :email, :aliases
        ).merge(password: params[:password])
      end
    end
  end
end
