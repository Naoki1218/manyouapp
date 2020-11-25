class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:title].present? && params[:task_status].present?
      @tasks = current_user.tasks.get_by_title(params[:title]).get_by_task_status(params[:task_status]).page(params[:page]).per(5)
    elsif params[:title].present?
      @tasks = current_user.tasks.get_by_title(params[:title]).page(params[:page]).per(5)
    elsif params[:task_status].present?
      @tasks = current_user.tasks.get_by_task_status(params[:task_status]).page(params[:page]).per(5)
    elsif params[:sort_expired]
      @tasks = current_user.tasks.order(task_limit_on: "DESC").page(params[:page]).per(5)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.order(priority:"DESC").page(params[:page]).per(5)
    else
      @tasks = current_user.tasks.order(id: "DESC").page(params[:page]).per(5)
    end

    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

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
    @task = current_user.tasks.find(params[:id])
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
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
    params.require(:task).permit(:title, :task_limit_on, :task_status, :priority, { label_ids: [] })
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
