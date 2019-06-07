class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def create
    # @user = User.create(user_params)
    @user = User.create(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], bio: params[:bio], avatar: params[:avatar], password: params[:password])
    byebug
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, token: @token }, status: :created
    else
      # puts "kljfwoiafklw" + @user.errors.full_message
      render json: { error: 'failed to create user'}, status: :not_acceptable
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
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :avatar)
  end

end
