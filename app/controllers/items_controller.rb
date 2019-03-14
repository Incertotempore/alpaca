class ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items_mapped = Item.where.not(latitude: nil, longitude: nil)

    @markers = @items_mapped.map do |item|
      {
        lng: item.longitude,
        lat: item.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { item: item })
      }
    end

    if params.has_key?(:q)
# search in SQL if found name containing anywhere(%) the value of research
      @items = Item.where('name ILIKE ? OR category ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @items = Item.all
    end
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
    redirect_to my_items_path(@item)
  end

  def my_items
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params["id"])
    @item.update(item_params)
    redirect_to my_items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to my_items_path
  end

  private

  def item_params
    params.require(:item).permit(:category, :name, :price, :description, :picture, :photo)
  end
end
