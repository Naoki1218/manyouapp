class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.order(id: "DESC")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # if params[:back]
    #   render :new
    # else
      if @task.save
        # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
        redirect_to tasks_path, notice: "タスクを作成しました！"
      else
        # 入力フォームを再描画します。
        render :new
      # end
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
      redirect_to tasks_path, notice: "タスクを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました！"
  end

  # def confirm
  #   @task = Task.new(task_params)
  #   render :new if @task.invalid?
  # end

  private
  def task_params
    params.require(:task).permit(:title, :task_limit_on, :task_status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
