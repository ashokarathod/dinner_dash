class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
      @users = User.all
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

  def require_same_user
    if current_user!= @user && !current_user.admin
      flash[:warning] = "user not right authorized user"
      redirect_to users_path
    end
  end

end