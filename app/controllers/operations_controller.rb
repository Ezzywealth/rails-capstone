class OperationsController < ApplicationController

  def index
    @operations = Operation.where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)
    @operation.user_id = current_user.id
    if @operation.save
      flash[:notice] = "Operation created successfully"
      redirect_to category_operations_path
    else
      flash[:alert] = "Operation not created"
      render 'new'
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, :date)
  end
end