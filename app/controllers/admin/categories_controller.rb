class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.order(:name).page params[:page]
    @category = Category.new
  end

  def create
    if @category.save
      flash[:success] = t "create_category_complete"
      redirect_to admin_categories_path
    else
      @categories = Category.order(:name).page params[:page]
      render :index
    end
  end

  def edit
  end

  def update
    if @category && @category.update_attributes(category_params)
      flash[:success] = t "category_updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "delete_category_complete"
    else
      flash[:danger] = t "delete_category_fail"
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :description, :time_limit, :number_question
  end
end
