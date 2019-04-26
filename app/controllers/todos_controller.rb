class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(params.require(:todo).permit(:title))
    if @todo.save
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_path
  end
end
