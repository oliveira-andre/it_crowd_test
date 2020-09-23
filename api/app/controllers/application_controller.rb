# frozen_string_literal: true

class ApplicationController < ActionController::API
  def serializer(data, serializer, status: 201)
    render json: "Api::V1::#{serializer}".constantize.new(data).serialize,
           status: status
  end
end
