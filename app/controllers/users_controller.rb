class UsersController < ApplicationController
  def update
    @user = find_user
    authorize @user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Profile updated successfully."
    else
      render Views::Users::Form.new(user: @user), status: :unprocessable_entity
    end
  end

  private

  def find_user
    @find_user ||= User.find_by_username!(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description, :private)
  end
end
