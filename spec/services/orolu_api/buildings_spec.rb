	# frozen_string_literal: true
	
require 'rails_helper'

RSpec.describe 'Services' do
    context "OruloApi::Buildings" do
      it "when providing access to the list of buildings", vcr: { cassette_name: 'orulo/buildings'} do
        buildings = OruloApi::Buildings.call
        expect(buildings.has_key?('buildings')).to be_truthy
      end
    end
end