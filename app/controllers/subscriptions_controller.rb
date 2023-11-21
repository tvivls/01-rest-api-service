class SubscriptionsController < ApplicationController
  # @NOTE: turn off CSRF
  skip_before_action :verify_authenticity_token

  def create
    user = User.find(params[:user_id])
    program = Program.find(params[:program_id])

    if Subscription.exists?(user: user, program: program)
      render json: { error: 'User is already subscribed to this program' }, status: :unprocessable_entity
    else
      render json: Subscription.create(
        user_id: params[:user_id],
        program_id: params[:program_id]
      )
    end
  end

  def new
  end

  def destroy
    subscription = Subscription.find(params[:id])

    if subscription.destroy
      render json: { message: 'Subscription deleted successfully' }
    else
      render json: { error: 'Failed to delete subscription' }, status: :unprocessable_entity
    end

    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
  end

  def user_programs
    @user_programs = Subscription.where(:user_id => params[:user_id]).includes(:user, :program)
    # render json: user_programs
  end
end
