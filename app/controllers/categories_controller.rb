class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:operations).where(author_id: current_user.id)
  end

  def show

  end

  def new

  end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    if @category.save
      flash[:notice] = "Category created successfully"
      redirect_to categories_path
    else
      flash[:alert] = "Category not created"
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :author_id, :icon)
  end

end