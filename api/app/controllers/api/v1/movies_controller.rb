# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :authenticate_person!

      def create
        serializer(Movies::Create.new(create_movie_params).fetch_and_validate)
      end

      private

      def create_movie_params
        params.require(:movie).permit(
          :title, :released_at, movie_people_attributes: %i[role person_id]
        )
      end
    end
  end
end
