class OffersController < ApplicationController
  def index
    @offers = Offer.where.not(latitude: nil)

    @category = params[:category]
    # @city = params[:city]
    @max_price = params[:max_price].to_i

    if @category
      @offers = @offers.where(category: @category)
    end
    # if @city
    #   @offers = @offers.where(city: @city)
    # end

    @markers = Gmaps4rails.build_markers(@offers) do |offer, marker|
      marker.lat offer.latitude
      marker.lng offer.longitude
      marker.infowindow render_to_string(:partial => "/offers/map_box", locals: {offer: offer})
    end
  end

  def show
    @alert_message = "You are viewing #{@offer.title}"
    @offer_coordinates = { lat: @offer.latitude, lng: @offer.longitude }
    @order = Order.new
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.owner = current_user
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
    params.require(:offer).permit(:title, :description, :address, :place_type, :category, :price, :photo)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
