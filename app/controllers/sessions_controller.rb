class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  # skip_after_action :verify_authorized

  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_path, alert: "Try again later." }

  layout "join"

  def new
    render Views::Sessions::New.new
  end

  def create
    user = User.find_by(email_address: params[:email_address])

    if user
      auth_code = user.auth_codes.create!
      UserMailer.auth_code(user, auth_code).deliver_later
    end

    render Views::Sessions::Create.new
  end

  def verify_auth_code
    auth_code = AuthCode.active.find_by(code: params[:auth_code])

    if auth_code
      user = auth_code.user
      auth_code.consume

      start_new_session_for(user)

      flash[:notice] = "Signed in successfully."

      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { render turbo_stream: helpers.turbo_stream_action_tag("redirect", url: root_path) }
      end
    else
      flash[:alert] = "Invalid or expired code. Please try again."
      render Views::Sessions::Create.new, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to root_path, status: :see_other
  end
end
