class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    find_item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.save
    redirect_to my_items_path(@item)
  end

  def my_items
    @items = Item.all
  end

  def edit
    find_item
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to my_items_path
  end

  def destroy
    find_item
    @item.destroy
    redirect_to my_items_path
  end

  private

  def item_params
    params.require(:item).permit(:category, :name, :price, :description, :picture)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
