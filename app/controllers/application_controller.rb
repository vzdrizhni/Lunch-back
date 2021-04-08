# frozen_string_literal: true

class ApplicationController < ActionController::API
  include SerializableResource
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 'yourSecret')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]

      begin
        JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    unless logged_in?
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  def is_admin?
    user = logged_in_user

    unless user.admin?
      render json: { message: 'You are not allowed to do that' }, status: :unauthorized
    end
  end
end
