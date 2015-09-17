class QuestionsController < ApplicationController
  load_and_authorize_resource

  before_action :check_question, only: [:edit, :update, :destroy]
  before_action :load_categories, only: [:new, :create, :edit, :update]

  def index
    @questions = current_user.questions.order("created_at DESC").page params[:page]
  end

  def new
     @question = Question.new
     @question.options.build
  end

  def create
    if @question.save
      flash[:success] = t "create_question_complete"
      redirect_to user_questions_path current_user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question && @question.update_attributes(question_params)
      flash[:success] = t "update_question_complete"
      redirect_to user_question_path current_user, @question
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "destroy_question_complete"
    else
      flash[:danger] = t "destroy_question_fail"
    end
    redirect_to user_questions_path current_user
  end

  private
  def question_params
    params.require(:question).permit :content, :category_id, :user_id,
      options_attributes: [:id, :content, :_destroy, :correct]
  end

  def check_question
    if @question.actived?
      flash[:warning] = t "question_actived"
      redirect_to user_questions_path current_user
    end
  end

  def load_categories
    @categories = Category.all
  end
end
