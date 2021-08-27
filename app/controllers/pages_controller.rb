class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @listings = Listing.all
    @bookings = Booking.all
  end
end
