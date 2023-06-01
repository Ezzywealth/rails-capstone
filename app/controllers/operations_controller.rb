class OperationsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @operations = OperationCategory.includes(:operation).where(category_id: @category.id).order(created_at: :desc)
  end

  def new
    @operation = Operation.new
  end

  def create
    category_id = params[:operation][:category_id]
    name = params[:operation][:name]
    amount = params[:operation][:amount]
    @operation = Operation.new(name:, amount:)
    @operation.user_id = current_user.id
    if @operation.save
      OperationCategory.create(operation_id: @operation.id, category_id:)
      flash[:notice] = 'Operation created successfully'
      redirect_to category_operations_path
    else
      flash[:alert] = 'Operation not created'
      render 'new'
    end
  end

end
