module Api
  module V1
    class ItemsController < ApplicationController
      def show
        item = Item.find(params[:id])
        render json: ItemSerializer.new(item)
      end

      def index
        items = if params[:merchant_id]
                  Item.where(merchant_id: params[:merchant_id])
                else
                  Item.all
                end
        render json: ItemSerializer.new(items)
      end

      def create
        item = Item.new(item_params)
        render json: ItemSerializer.new(item) if item.save
      end

      def update
        item = Item.update(params[:id], item_params)
        render json: ItemSerializer.new(item)
      end

      def destroy
        item = Item.destroy(params[:id])
        render json: ItemSerializer.new(item)
      end

      private

      def item_params
        params.permit(:name, :description, :unit_price, :merchant_id)
      end
    end
  end
end
