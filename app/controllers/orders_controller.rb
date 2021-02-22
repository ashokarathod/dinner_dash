class OrdersController < ApplicationController
  before_action  :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @orders = Order.paginate(page: params[:page], per_page: 5)
  end

  def show
   
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = 'order was created secussfully.'
      redirect_to @order
    else
      render 'new'
    end
  end
  
  def edit

  end

  def update
    if @order.update(order_params)
      flash[:success] = "Order Updated successfully.."
      redirect_to orders_path
    else
    render action: :edit
    end
  end

  def destroy
    @order.destroy
    flash[:notice] = 'Successfully deleted.'
    redirect_to orders_path
  end

  # def search
  #   @orders = Order.where("name LIKE ?", "%" + params[:q] + "%")
  # end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :transaction_id, :user_id)
  end

  def require_same_user
    if current_user!= @user && !current_user.admin
      flash[:warning] = "user not right authorized user"
      redirect_to users_path
    end
  end

end