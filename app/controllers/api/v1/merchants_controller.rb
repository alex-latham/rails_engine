module Api
  module V1
    class MerchantsController < ApplicationController
      def show
        merchant_ = if params[:item_id]
                      Item.find(params[:item_id]).merchant
                    else
                      Merchant.find(params[:id])
                    end
        render json: MerchantSerializer.new(merchant_)
      end

      def index
        merchants = Merchant.all
        render json: MerchantSerializer.new(merchants)
      end

      def create
        merchant = Merchant.new(merchant_params)
        render json: MerchantSerializer.new(merchant) if merchant.save
      end

      def update
        merchant = Merchant.update(params[:id], merchant_params)
        render json: MerchantSerializer.new(merchant)
      end

      def destroy
        merchant = Merchant.destroy(params[:id])
        render json: MerchantSerializer.new(merchant)
      end

      private

      def merchant_params
        params.permit(:name)
      end
    end
  end
end
