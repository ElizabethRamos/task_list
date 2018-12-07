class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:description, :status))
     if @task.save
       redirect_to root_path
     else 
      render :new
     end
  end

  def edit
    @task = Task.find(params[:id])
  end 

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:description, :status))
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end
end