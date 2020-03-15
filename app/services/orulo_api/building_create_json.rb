# frozen_string_literal: true

module OruloApi
  # Class responsible for merge favorites and buildings from user in json
  class BuildingCreateJson < ApplicationService

    def initialize(buildings_json, current_user)
      @buildings = buildings_json.to_a
      @user_favorited_buildings = current_user.favorite_buildings['ids'].to_a
    end

    def call
      data = JSON.parse(merge_json)
      data
    end
    
    private

    def merge_json
      @buildings.map do |building|
      building.merge({ 
          favorited: user_favorited?(building['id'])
        })
      end.to_json
    end
    
    def user_favorited?(building_id)
      @user_favorited_buildings.include?(building_id) ? true : false
    end
  end
end