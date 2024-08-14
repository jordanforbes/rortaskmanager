class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end

  def new
    @user = User.find(params[:user_id])
    @task = @user.tasks.new(task_params)
    if @task.save
      redirect_to user_tasks_path(@user), notice: "Task was successfully created"
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "Task was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_path(@task.user), notice: "Task was successfully deleted"
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

end
