class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer.delete
    redirect_to offers_path
  end

  private
  def offer_params
    params.require(:offer).permit(:title, :description, :address, :type, :category, :price, :photo)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
