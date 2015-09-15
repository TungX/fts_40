class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

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
  def question_params
    params.require(:question).permit :state
  end
end
