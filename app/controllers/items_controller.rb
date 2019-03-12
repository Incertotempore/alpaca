class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.save
    redirect_to item_path(@item)
  end

  def my_items
  end

  def my_item
  end

  def patch
  end

  private

  def item_params
    params.require(:item).permit(:category, :name, :price, :description, :picture)
  end
end
