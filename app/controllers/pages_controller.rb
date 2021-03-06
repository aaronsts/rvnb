class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @listings = Listing.all.limit(6)
  end

  def dashboard
    @listings = Listing.all
    @bookings = Booking.all
  end
end
