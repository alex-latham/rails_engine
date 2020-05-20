module Api
  module V1
    class Merchants::RevenuesController < ApplicationController
      def index
        merchants = Merchant.most_revenue(params[:quantity])
        render json: MerchantSerializer.new(merchants)
      end
    end
  end
end
