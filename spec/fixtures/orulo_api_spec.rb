# frozen_string_literal: true

require 'rails_helper'
require 'uri'
require 'net/http'

RSpec.describe 'OruloApi' do
  describe '.call' do
    context 'with authorization' do
      it 'returns success status', vcr: {
        cassette_name: 'orulo/buildings'
      } do
        authorization = Rails.application.credentials.dig(:orulo,
                                                          :authorization)
        url_params = 'https://www.orulo.com.br/api/v2/buildings'

        url = URI(url_params)

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request['Authorization'] = authorization
        response = https.request(request)
        expect(response.code).to eql('200')
      end
    end

    context "when don't have authorization" do
      it 'returns unauthorized status', vcr: {
        cassette_name: 'orulo/buildings_error'
      } do
        authorization = ''
        url_params = 'https://www.orulo.com.br/api/v2/buildings'

        url = URI(url_params)

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request['Authorization'] = authorization
        response = https.request(request)
        expect(response.code).to eql('401')
      end
    end
  end
end
