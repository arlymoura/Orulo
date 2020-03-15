module Api
  module V1
    class BuildingsController < BaseController
      def index
        user = User.last
        buildings = OruloApi::Buildings.call
        new_buildings = OruloApi::BuildingCreateJson.call(buildings, user)
        render json: new_buildings
      end

      # def create
      #   respond_with :api, :v1, Item.create(item_params)
      # end

      # def destroy
      #   respond_with Item.destroy(params[:id])
      # end

      # def update
      #   item = Item.find(params["id"])
      #   item.update_attributes(item_params)
      #   respond_with item, json: item
      # end

      private

      def user_params
        params.require(:item).permit(:id, :name, :email, :favorite_buildings)
      end
    end
  end
end