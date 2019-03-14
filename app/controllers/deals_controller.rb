class DealsController < ApplicationController

  # Provisional view for testing
  def index
    @deals = Deal.all
  end

  def success
    @deal = Deal.find(params[:id])
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def new
    @deal = Deal.new
    @item = Item.find(params[:item_id])
    @deal.user = current_user
    @deal.item = @item
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to deal_success_path(@deal)
    else
      render :new
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to item_path
  end

  private

  def deal_params
    params.require(:deal).permit(:user_id, :item_id)
  end

end
