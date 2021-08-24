class ListingsController < ApplicationController
  def top
  end

  def index
    @listings = Listing.all
    @listings = policy_scope(Listing)
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new
    authorize @listing
  end

  def destroy
    authorize @listing
  end
end
