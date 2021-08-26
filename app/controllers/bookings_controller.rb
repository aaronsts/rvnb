class BookingsController < ApplicationController
  # def show
  #   @booking = Booking.find()
  # end

  def new
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.total_price = (@booking.end_date - @booking.start_date) * @listing.price
    @booking.listing = @listing
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to listing_path(@listing)
    else
      # do something else
      raise
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @listing = @booking.listing_id
    @booking.destroy
    redirect_to listing_path(@listing)
    authorize @booking
  end

    private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
