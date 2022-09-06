class RequestsController < ApplicationController
  before_action :set_listing, only: %i[new create show]
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.listing = @listing

    if @request.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # add edit and delete, index and show functions for current_user?
  def index
    @requests = Request.all
  end

  def show
  end

 private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def request_params
    params.require(:request)
  end
end
