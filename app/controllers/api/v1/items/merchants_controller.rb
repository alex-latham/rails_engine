module Api
  module V1
    class Items::MerchantsController < ApplicationController
      def show
        merchant = Item.find(params[:item_id]).merchant
        render json: MerchantSerializer.new(merchant)
      end
    end
  end
end
