class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def items_params
    params.require(:item).permit(:mane, :explanation, :category_id, :status_id, :burden_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end
end
