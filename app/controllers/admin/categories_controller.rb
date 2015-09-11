class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :destroy, :update]

  def index
    @categories = Category.order(:name).page params[:page]
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "create_category_complete"
      redirect_to admin_categories_path
    else
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
    end
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit :name, :description, :time_limit
  end

  def load_category
    @category = Category.find_by id: params[:id]
  end
end
