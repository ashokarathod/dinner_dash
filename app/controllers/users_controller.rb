class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
      @users = User.all
      respond_to do |format|
        format.html
        format.json {render json: @users}
      end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "welcome to  #{(@user.name)}"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @orders = @user.orders
    @order_count = Order.group("id").count
  end

  def destroy
    @user.destroy
    flash[:notice] = "succussfully deleted user"
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end