module Api
  module V1
    class Items::SearchesController < ApplicationController
      def show
        item = Search.partial_name(Item, params[:name]).first
        render json: ItemSerializer.new(item)
      end

      def index
        items = Search.partial_name(Item, params[:name])
        render json: ItemSerializer.new(items)
      end
    end
  end
end
