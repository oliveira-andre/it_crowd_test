# frozen_string_literal: true

module Api
  module V1
    class PeopleController < ApplicationController
      before_action :authenticate_person!, except: :create

      def create
        serializer(People::Create.new(create_person_params).fetch_and_validate)
      end

      def update
        serializer(People::Update.new(update_person_params).fetch_and_validate)
      end

      def show
        serializer(People::Show.new(show_person_params).fetch)
      end

      private

      def create_person_params
        params.require(:person).permit(
          :first_name, :last_name, :email, :aliases
        ).merge(password: params[:password])
      end

      def update_person_params
        params.require(:person).permit(
          :first_name, :last_name, :aliases
        ).merge(id: @current_person.id)
      end

      def show_person_params
        params.merge(id: @current_person.id)
      end
    end
  end
end
