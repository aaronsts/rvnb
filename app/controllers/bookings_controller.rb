class BookingsController < ApplicationController
  def show
    @booking = Booking.find()
  end

  def new
    @listing = Listing.find(params[:id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing

    if @booking.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @listing = @booking.listing_id
    @booking.destroy
    redirect_to listing_path(@listing)
  end
end
