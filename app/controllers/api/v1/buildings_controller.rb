# frozen_string_literal: true

module Api
  module V1
    class BuildingsController < BaseController
      def index
        user = User.find(params[:user_id])
        buildings = OruloApi::Buildings.call
        new_buildings = OruloApi::BuildingCreateJson.call(buildings, user)
        render json: new_buildings
      end

      def change_user_favorite_building
        user = User.find(params[:user_id])
        favorited = convert_bol(params[:favorited])
        building_id = params[:building_id]

        user.favorite_buildings['ids'].delete(building_id) if favorited
        user.favorite_buildings['ids'].append(building_id) unless favorited

        user.save
        render json: {}
      end

      private

      def convert_bol(obj)
        ActiveRecord::Type::Boolean.new.cast(obj)
      end
    end
  end
end
