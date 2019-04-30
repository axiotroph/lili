class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    @todo = Todo.new(params.require(:todo).permit(:title))
    @todo.save
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_path
  end
end
