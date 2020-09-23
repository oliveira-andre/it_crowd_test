# frozen_string_literal: true

module Api
  module V1
    class ApplicationValidator
      attr_accessor :params

      def initialize(params = {})
        @params = params
      end
    end
  end
end
