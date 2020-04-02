class TodosController < ApplicationController

  def index
    todos = Todo.all
    render json: todos
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: {error: 'Failed to create todo item'}
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render json: {error: 'Failed to update todo item'}
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: {message: 'Successfully deleted todo item'}
    else 
      render json: {error: 'Failed to delete todo item'}
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:id, :title, :notes, :completed?, :date, :user_id)
  end

end
