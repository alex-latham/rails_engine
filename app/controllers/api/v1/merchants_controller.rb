module Api
  module V1
    class MerchantsController < ApplicationController
      def show
        merchant = Merchant.find(params[:id])
        render json: MerchantSerializer.new(merchant)
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
        merchant = Merchant.find(params[:id])
        merchant.update(merchant_params)
        render json: MerchantSerializer.new(merchant)
      end

      def destroy
        merchant = Merchant.find(params[:id])
        merchant.destroy
        render json: MerchantSerializer.new(merchant)
      end

      private

      def merchant_params
        params.permit(:name)
      end
    end
  end
end