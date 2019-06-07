class Api::V1::AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def create
    # byebug;
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def show
    # token = request.headers['Authenticate']
    # decoded = JWT.decode(token, 'secret', true, { algorithm: 'HS256' }).first
    # id = decoded["id"]
    #
    # user = User.find_by(id: id)
    # byebug
    if current_user
      render json: {id: current_user.id, username: current_user.username}
    else
      render json: {error: "Could not authenticate"}, status: 401
    end
  end

  private

  def user_login_params
    params.require(:auth).permit(:username, :password)
  end

end
