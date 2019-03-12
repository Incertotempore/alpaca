class DealsController < ApplicationController

  # Provisional view for testing
  def index
    @deals = Deal.all
  end

  def new
    @deal = Deal.new
    @user = User.find(params[:user_id])
    @item = Item.find(params[:item_id])
  end

  def create
    @user = User.find(params[:user_id])
    @item = Item.find(params[:item_id])
    @deal = Deal.new(deal_params)
    @deal.user = @user
    @deal.item = @item
    if @deal.save
      redirect_to item_path
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
    params.require(:deal).permit(:date_start, :date_end, :user_id, :item_id)
  end

end
