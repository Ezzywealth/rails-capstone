class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:operations).where(user_id: current_user.id)
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    puts current_user.id
    @category.user_id = current_user.id
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to categories_path
    else
      puts @category.errors.full_messages
      flash[:alert] = 'Category not created'
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
