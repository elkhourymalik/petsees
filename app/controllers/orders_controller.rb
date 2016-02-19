class OrdersController < ApplicationController
  before_action :find_offer, only: [ :new, :create]
  before_action :set_order, only: [:accept, :refuse]

  def accept
    @order.status = "accepted"
    @order.save
    redirect_to :back
  end

  def refuse
    @order.status = "refused"
    @order.save
    redirect_to :back
  end

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
    @order.renter = current_user
    if  @order.save
      redirect_to user_path(current_user.id), notice: 'Successfully booked'
    else
      render :new
    end
  end

# DELETE "offers/42/orders/25"
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :offer_id, :start_date, :end_date)
  end

  def find_offer
    @offer = Offer.find(params[:offer_id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end
end
