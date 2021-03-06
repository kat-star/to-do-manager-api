class UsersController < ApplicationController
  # find_user = User.find(params[:id])
  def index
    users = User.all
    render json: users
  end
  
  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {error: 'Failed to create user'}
    end
  end

  # def update
  #   user = User.find(params[:id])
  #   if user.update(user_params)
  #     render json: user
  #   else
  #     render json: {error: 'Failed to update user'}
  #   end
  # end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {message: 'Successfully deleted user'}
    else 
      render json: {error: 'Failed to delete user'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name)
  end

end
