module Api
  module V1
    class Merchants::MostItemsController < ApplicationController
      def index
        merchants = Merchant.most_items(params[:quantity])
        render json: MerchantSerializer.new(merchants)
      end
    end
  end
end
