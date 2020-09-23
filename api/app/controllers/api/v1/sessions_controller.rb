# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        serializer(
          Sessions::Create.new(create_session_params).fetch_and_validate
        )
      end

      private

      def create_session_params
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
