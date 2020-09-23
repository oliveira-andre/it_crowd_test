# frozen_string_literal: true

module Api
  module V1
    class ApplicationSerializer
      attr_accessor :data

      def initialize(data)
        @data = data
      end
    end
  end
end
