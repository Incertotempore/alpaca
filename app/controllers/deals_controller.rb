class DealsController < ApplicationController

  # Provisional view for testing
  def index
    @deals = Deal.all
  end

  def new
    @deal = Deal.new
    @item = Item.find(params[:item_id])
    @user = current_user
    create # for testing as no button for the moment
  end

  def create
    @deal.user = @user
    @deal.item = @item
    if @deal.save
      redirect_to items_path
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
