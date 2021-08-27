class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listings = Listing.all
    @listings = policy_scope(Listing)

    if params[:name_query].present?
      @listings = @listings.search_by_name(params[:name_query])
    end

    if params[:capacity_query].present?
      @listings = @listings.search_by_capacity(params[:capacity_query])
    end

    if params[:price_query].present?
      @listings = @listings.search_by_price(params[:price_query])
    end

    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window: render_to_string(partial: "info_window", locals: { listing: listing }),
        image_url: helpers.asset_url('logo-RVnB.png')
      }
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @markers = [{ lat: @listing.latitude, lng: @listing.longitude, image_url: helpers.asset_url('logo-RVnB.png'), info_window: render_to_string(partial: "info_window", locals: { listing: @listing })}]
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to listings_path
    authorize @listing
  end

  private

  def listing_params
    params.require(:listing).permit(:vehicle_name, :description, :location, :capacity, :price, photos: [])
  end
end
