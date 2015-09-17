class Admin::ExamsController < ApplicationController
  load_and_authorize_resource

  def index
    @exams = Exam.to_check.order(:state).order("updated_at DESC").page params[:page]
  end

  def show
    @disabled = true
  end

  def update
    if @exam && @exam.update_attributes(exam_params)
      flash[:success] = t "update_exam_complete"
    else
      flash[:danger] = t "update_exam_fail"
    end
    redirect_to admin_exams_path
  end

  def exam_params
    params.require(:exam).permit :state, results_attributes: [:id, :correct]
  end
end
