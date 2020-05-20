module Api
  module V1
    class Merchants::SearchesController < ApplicationController
      def show
        merchant = Search.partial_name(Merchant, params[:name]).first
        render json: MerchantSerializer.new(merchant).serialized_json
      end

      def index
        merchants = Search.partial_name(Merchant, params[:name])
        render json: MerchantSerializer.new(merchants).serialized_json
      end
    end
  end
end
