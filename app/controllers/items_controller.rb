class ItemsController < ApplicationController
    before_action  :set_item, only: [:show, :edit, :update, :destroy]

    def show
        @category_title =  Category.find(params[:id])
    end
  
    def index
        @items = Item.all
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

    private

    def set_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :description, :price, :category_id)
    end
end