class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @listings = Listing.all.limit(3)
  end

  def profile
    @listings = current_user.listings
    @listings = Listing.all
    @requests = current_user.requests
    @requests = Request.all
    # how to access requests on current_user's listing?
    # swaps = current_user.swaps.select { |swap| swap.state == "paid" }
    # @user_swaps = swaps.map { |swap| swap.listing}
  end
end
