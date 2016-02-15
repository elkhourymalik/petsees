class OrdersController < ApplicationController
  before_action :find_offer, only: [ :new, :create, :index, :show, :destroy]

 # GET "orders"
  def index
    @orders = Order.all
  end

  # GET "orders/42"
  def show
    @order = Order.find(params[:id])
  end

# GET "offers/42/orders/new"
  def new
    @order = Order.new
  end

# POST "offers/42/orders"
  def create
  @order = @offer.orders.build(order_params)
    if  @order.save
      respond_to do |format|
      format.html { redirect_to offer_path(@offer), notice: 'Order was successfully booked.' }
      format.json { head :no_content }
    else
      render :new, notice: 'Please, try again the booking.'
    end
  end

# DELETE "offers/42/orders/25"
  def destroy
    @order = order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :offer_id)
  end

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

end
