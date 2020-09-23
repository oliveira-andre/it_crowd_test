# frozen_string_literal: true

module Api
  module V1
    class SessionsSerializer < ApplicationSerializer
      def serialize
        { token: data.token }.compact
      end
    end
  end
end
