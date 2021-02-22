class CartsController < ApplicationController

  def index
    @items = Item.all
  end

end