class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @offer = Offer.new
  end

  def about
  end
end
