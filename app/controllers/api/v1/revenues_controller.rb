module Api
  module V1
    class RevenuesController < ApplicationController
      def index
        revenue = Revenue.between_dates(params[:start], params[:end])
        render json: RevenueSerializer.new(revenue)
      end
    end
  end
end
