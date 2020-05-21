module Api
  module V1
    class Merchants::MostRevenueController < ApplicationController
      def index
        merchants = Merchant.most_revenue(params[:quantity])
        render json: MerchantSerializer.new(merchants)
      end
    end
  end
end
