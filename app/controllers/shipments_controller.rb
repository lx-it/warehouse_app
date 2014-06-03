class ShipmentsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @shipment = current_user.shipments.build(shipment_params)
    if @shipment.save
      flash[:success] = "Shipment created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @shipment.destroy
    redirect_to root_url
  end

  private

    def shipment_params
      params.require(:shipment).permit(:content)
    end

    def correct_user
      @shipment = current_user.shipments.find_by(id: params[:id])
      redirect_to root_url if @shipment.nil?
    end

end