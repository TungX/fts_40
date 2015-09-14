class Admin::QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :update, :destroy]
  def index
    @questions = Question.order(:state).order("updated_at DESC").page params[:page]
  end

  def show
  end

  def update
    if @question && @question.update_attributes(question_params)
      flash[:success] = t "question_actived"
    end
    redirect_to :back
  end

  def destroy
    if @question.destroy
      flash[:success] = t "destroy_question_complete"
    end
    redirect_to admin_questions_path
  end

  private
  def load_question
    @question = Question.find_by id: params[:id]
  end

  def question_params
    params.require(:question).permit :state
  end
end
