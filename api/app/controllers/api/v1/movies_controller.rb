# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      before_action :authenticate_person!, except: :index

      def index
        serializer(Movies::Index.new.fetch)
      end

      def create
        serializer(Movies::Create.new(create_movie_params).fetch_and_validate)
      end

      def update
        serializer(Movies::Update.new(update_movie_params).fetch_and_validate)
      end

      def destroy
        serializer(Movies::Destroy.new(movie_id_params).fetch_and_destroy)
      end

      def show
        serializer(Movies::Show.new(movie_id_params).fetch)
      end

      private

      def create_movie_params
        params.require(:movie).permit(
          :title, :released_at, movie_people_attributes: %i[role person_id]
        )
      end

      def update_movie_params
        params.require(:movie).permit(
          :title, :released_at, movie_people_attributes: %i[id role person_id]
        ).merge(movie_id: params[:id])
      end

      def movie_id_params
        params.merge(id: params[:id])
      end
    end
  end
end
