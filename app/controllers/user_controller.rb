class UserController < ApplicationController
  include ErrorModule
  # POST /signup
  def create_user
    user = User.new(user_params)

    if user.save
      render json: { status: 'SUCCESS', message: 'User created', data: user },
             status: :ok
    elsif user.errors[:password_confirmation].present?
      render json: { status: 'ERROR', message: 'Password mismatched' },
             status: :SUCCESS
      # raise ErrorModule::PasswordMismatchedError, 'Password mismatched'
    elsif user.errors[:email].present?
      render json: { status: 'ERROR', message: 'Email already registered' },
             status: :SUCCESS
      # raise ErrorModule::AlreadyEmailTakenError, 'Email already registered'
    elsif user.errors[:phone].present?
      render json: { status: 'ERROR', message: 'Phone already registered' },
             status: :SUCCESS

      # raise ErrorModule::AlreadyPhoneTakenError, 'Phone already registered'
    else
      render json: { status: 'ERROR', message: 'User not created', data: user.errors },
             status: :unprocessable_entity
      # render json: { status: 'ERROR', message: 'User not created', data: user.errors },
      #        status: :unprocessable_entity
      #
    end
  end

  private

  def user_params
    params.permit(:email, :phone, :password, :password_confirmation)
  end
end
