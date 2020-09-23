# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ServiceException do |e|
    error_serializer(e.message)
  end

  def serializer(data, serializer, status: 201)
    render json: "Api::V1::#{serializer}".constantize.new(data).serialize,
           status: status
  end

  def error_serializer(error_message)
    render json: { errors: error_message }, status: 422
  end
end
