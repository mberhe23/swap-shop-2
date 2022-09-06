class SwapsController < ApplicationController
  def new
    @swap = Swap.new
  end

  def create
    @swap = Swap.new(swap_params)
    @swap.listing = @listing
    @swap.request = @request
    if @swap.save
      redirect_to profile_path
    # else
    #   render
    end
  end

  # add delete to cancel the swap and relist both items
  # add delete when 1 of the 2 users clicks "Swap Complete" from their profile - deletes both listings
  # maybe 2nd user should have to confirm ^this^ before the listings are deleted
  # show and index functions for current_user?

  private

  def swap_params
    params.require(:swap)
  end
end
