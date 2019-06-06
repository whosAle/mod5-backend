class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def create
    # @user = User.create(user_params)
    @user = User.create(username: params[:username], password: params[:password])
    byebug
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :created
    else
      # puts "kljfwoiafklw" + @user.errors.full_message
      render json: { error: 'failed to create user', message: @user.errors.full_message }, status: :not_acceptable
    end
  end

  def index
    result = Schema.execute params[:query]
    render json: result
  end

  def query
    result = Schema.execute params[:query]
    render json: result
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar)
  end

end
