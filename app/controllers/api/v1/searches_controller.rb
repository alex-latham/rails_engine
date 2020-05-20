module Api
  module V1
    class SearchesController < ApplicationController
      def show
        resource_class = find_resource_class
        resource = Search.partial_matches(resource_class, params[:name]).first
        render json: BaseSerializer.by_resource_class(resource_class, resource)
      end

      def index
        resource_class = find_resource_class
        resources = Search.partial_matches(resource_class, params[:name])
        render json: BaseSerializer.by_resource_class(resource_class, resources)
      end

      private

      def find_resource_class
        if params[:resource] == "items"
          Item
        elsif params[:resource] == "merchants"
          Merchant
        end
      end
    end
  end
end
