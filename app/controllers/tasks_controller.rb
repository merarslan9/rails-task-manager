class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    # creating a new task
    @task = Task.new
  end

  def create
    # posting the created task
    @task = Task.create(task_params)
    redirect_to tasks_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to restaurants_path
  end

  private

  def set_task
    # this is for finding the specified task for the specified id in the params
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
