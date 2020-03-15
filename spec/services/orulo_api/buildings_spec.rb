# frozen_string_literal: true

RSpec.describe 'OruloApi::Buildings' do
  describe '.call' do
    context 'when have access' do
      it 'has buildings key present', vcr: { cassette_name: 'orulo/buildings' } do
        buildings = OruloApi::Buildings.call
        expect(buildings.empty?).to_not be_truthy
      end
    end
  end
end
