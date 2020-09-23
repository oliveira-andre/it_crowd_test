# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ServiceException do |e|
    error_serializer(e.message)
  end

  def serializer(params = {})
    data = params[:data]
    serializer = params[:serializer]
    status = params[:status] || 200

    render json: serializer.new(data).serialize, status: status
  end

  def error_serializer(error_message)
    render json: { errors: error_message }, status: 422
  end
end
