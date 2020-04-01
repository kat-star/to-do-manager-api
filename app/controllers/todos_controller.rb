class TodosController < ApplicationController

  def index
    todos = Todo.all
    render json: todos
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

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: {error: 'Failed to update todo'}
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {message: 'Successfully deleted user'}
    else 
      render json: {error: 'Failed to delete user'}
    end
  end

  private

  def todo_params
    params.require(todo).permit(:title, :notes, :completed?, :date, :user_id)
  end

end
