# frozen_string_literal: true

class SignInService < ApplicationService
  def initialize(token)
    @token = token&.split(' ')&.last
  end

  def execute
    current_person
  end

  private

  def current_person
    Person.find(id)
  rescue ActiveRecord::RecordNotFound
    raise ServiceException.new, t('errors.not_found')
  end

  def id
    @id = decoded_token.first.with_indifferent_access[:data]
    return @id if @id

    raise ServiceException.new, t('errors.invalid_token')
  end

  def decoded_token
    JWT.decode(@token, JWT_SECRET, true, { algorithm: 'HS256' })
  rescue JWT::DecodeError
    raise ServiceException.new, t('errors.invalid_token')
  rescue JWT::ExpiredSignature
    raise ServiceException.new, t('errors.token_expired')
  end
end
