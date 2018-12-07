class TasksController < ApplicationController
  def new
    @task = Task.new
    @categories = Category.all
  end

  def create
    @task = Task.new(params.require(:task).permit(:description, :status, :category_id))
     if @task.save
       redirect_to root_path
     else
      @categories = Category.all
      render :new
     end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all
  end 

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:description, :status, :category_id))
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end
end