class UsersController < ApplicationController
  # @NOTE: turn off CSRF
  skip_before_action :verify_authenticity_token

  def index
    @users = User.all
  end

  def create
    render json: User.create(
      email: params[:email],
      name: params[:name]
    )
  end

  def show
    @user = User.find(params[:id])

    render json: @user

    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
  end

  def new
  end
end
