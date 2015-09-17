class ExamsController < ApplicationController
  load_and_authorize_resource

  before_action :check_category, only: [:create]

  def index
    @exam = current_user.exams.new
    @exams = current_user.exams.order("created_at DESC").page params[:page]
    @categories = Category.all
  end

  def create
    @exam = current_user.exams.new exam_params
    if @exam.save
      flash[:success] = t "create_exam_complete"
    else
      flash[:danger] = t "you_need_complete_exam"
    end
    redirect_to exams_path
  end

  def show
    @time_limit = @exam.category.time_limit
    if @exam.time_start
      @time_start = @exam.time_start
    else
      @time_start = Time.now().to_i
      @exam.update_attributes time_start: @time_start, state: :testing
    end
    @disabled = !@exam.testing?
  end

  def update
    @exam.state = :unchecked if params[:commit] == Settings.commit_finish
    @exam.time_end = Time.now().to_i
    if @exam.update_attributes update_params
      flash[:success] = t "update_exam_complete"
    else
      flash[:danger] = t "update_exam_fail"
    end
    redirect_to exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :category_id
  end

  def update_params
    params.require(:exam).permit results_attributes: [:id, :option_id]
  end

  def check_category
    category = Category.find params[:exam][:category_id]
    if category.questions.count < 1
      flash[:danger] = "#{t "questions_of"} #{category.name} #{t "empty"}"
      redirect_to exams_path
    end
  end
end
