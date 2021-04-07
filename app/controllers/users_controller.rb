# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]
  before_action :is_admin?, only: [:index]

  def index
    users = User.all

    if users
      render json: { data: users, success: true }
    else
      render json: {success: false, message: "No users found"}
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: @user.errors.full_messages }
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid username or password' }
    end
  end

  def update
    @user = logged_in_user

    if @user.admin
      edited_user = User.find_by(id: params[:id])
      edited_user.update(user_params)
      render json: { user: edited_user }
    elsif @user
      @user.update(user_params)
      render json: { user: @user }
    else
      render json: { msg: @user.errors.full_messages }
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end
end
