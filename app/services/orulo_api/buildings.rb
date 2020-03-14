# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module OruloApi
  # Class responsible for return orulo_api data
  class Buildings < ApplicationService

    def call
      access_orulo_api(url_params)
    end

    private

    def access_orulo_api(url_params)
      url = URI(url_params)
  
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
  
      request = Net::HTTP::Get.new(url)
      request['Authorization'] = authorization
      response = https.request(request)
      JSON.parse(response.read_body)
    end

    def url_params
      'https://www.orulo.com.br/api/v2/buildings'
    end

    def authorization
      Rails.application.credentials.dig(:orulo, :authorization)
    end

  end
end
