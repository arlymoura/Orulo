# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'OruloApi::BuildingsCreateJson' do
  describe '.call' do
    context 'when provide access to the list' do
      it 'merge buildings and user favorite buildings', vcr: { cassette_name: 'orulo/buildings' } do
        user = create(:user)
        buildings = OruloApi::Buildings.call
        new_buildings = OruloApi::BuildingCreateJson.call(buildings, user)
        expect(new_buildings.first.include?('favorited')).to be_truthy
      end
    end

    context 'when user favorites building' do
      it 'save building', vcr: { cassette_name: 'orulo/buildings' } do
        user = build(:user)
        buildings = OruloApi::Buildings.call
        user.favorite_buildings['ids'].append(buildings.first['id'])

        new_buildings = OruloApi::BuildingCreateJson.call(buildings, user)

        expect(new_buildings.first['favorited']).to be_truthy
      end
    end

    context 'when user removes building from it favorites', vcr: { cassette_name: 'orulo/buildings' } do
      before do
        user = build(:user)
        buildings = OruloApi::Buildings.call
        user.favorite_buildings['ids'].append(buildings.first['id'])
        user.favorite_buildings['ids'].append(buildings.last['id'])
        user.favorite_buildings['ids'].delete(buildings.first['id'])

        @new_buildings = OruloApi::BuildingCreateJson.call(buildings, user)
      end

      it { expect(@new_buildings.first['favorited']).to_not be_truthy }
    end
  end
end
