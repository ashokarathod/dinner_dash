class ItemsController < ApplicationController
  before_action  :set_item, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    #@category = Category.find(params[:id])
  end

  def index
    @items = Item.paginate(page: params[:page], per_page: 5)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'recipe was created secussfully.'
      redirect_to @item
    else
      render 'new'
    end
  end
  
  def edit

  end

  def update
    if @item.update(item_params)
      flash[:success] = "Item Updated successfully.."
      redirect_to items_path
    else
    render action: :edit
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = 'Successfully deleted.'
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id)
  end

  def require_same_user
    if current_user!= @user && !current_user.admin
      flash[:warning] = "user not right authorized user"
      redirect_to users_path
    end
  end
end