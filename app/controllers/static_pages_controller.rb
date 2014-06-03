class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @shipment  = current_user.shipments.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end


end
