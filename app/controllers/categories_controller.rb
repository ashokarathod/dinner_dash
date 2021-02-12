class CategoriesController < ApplicationController
   
    before_action  :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
        @items = @category.items
    end
    
    def new
      @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "category succussfully created"
            redirect_to @category
        else
            render action: :new
        end
    end

    def edit

    end

    def update
        if @category.update(category_params)
            flash[:notice] = 'category succssefuly created..'
            redirect_to categories_path
        else
            render action: :edit
        end
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:title, :description)
    end
end