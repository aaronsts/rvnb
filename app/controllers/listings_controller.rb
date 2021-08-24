class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def top
  end

  def index
    @listings = policy_scope(Listing)
  end

  def show
    authorize @listings
  end

  def new
    authorize @listings
  end

  def create
    authorize @listings
  end

  def destroy
    authorize @listings
  end
end
