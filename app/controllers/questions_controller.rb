class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  def index
    @questions = current_user.questions.order("created_at DESC").page params[:page]
  end

  def new
     @question = Question.new
     @question.options.build
     @categories = Category.all
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t "create_question_complete"
      redirect_to user_questions_path current_user
    else
      flash[:danger] = t "create_question_fail"
      @categories = Category.all
      render :new
    end
  end

  def show
  end

  def edit
    @categories = Category.all
  end

  def update
    @categories = Category.all
    if @question && @question.update_attributes(question_params)
      flash[:success] = t "update_question_complete"
      redirect_to user_question_path current_user, @question
    else
      flash[:danger] = t "update_question_fail"
      @categories = Category.all
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
    params.require(:question).permit :content, :category_id, :user_id, :state,
      options_attributes: [:id, :content, :_destroy, :correct]
  end

  def load_question
    @question = Question.find_by params[:id]
  end
end
