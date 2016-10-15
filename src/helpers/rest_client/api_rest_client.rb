# noinspection RubyResolve

require 'rest-client'
require 'json'
require_relative '../config/configuration'
require_relative '../data_helper'

# noinspection ALL
class ApiRestClient
  def initialize
    @config = Configuration.new
    @base_url = @config.get('url')
    @token = @config.get('account/token')
    @header = {'X-TrackerToken' => @token}
  end

  def get_request (url)
    response = nil
    begin
      final_url = @base_url + url
      response = RestClient.get final_url, @header
    rescue RestClient::ExceptionWithResponse => err
      response = err.response
    end
    response.code
    body = JSON.parse(response.body.to_s)
    [response.code, body]
  end

  def post_request(url, json)
    response = nil
    begin
      final_url = @base_url + url
      response = RestClient.post final_url, json, @header
      rescue RestClient::ExceptionWithResponse => err
        response = err.response
    end
    response.code
    body = JSON.parse(response.body.to_s)
    [response.code, body]
  end

  def put_request(url, json)
    response = nil
    begin
      final_url = @base_url + url
      response = RestClient.put final_url, json, @header
    rescue RestClient::ExceptionWithResponse => err
      response = err.response
    end
    response.code
    body = JSON.parse(response.body.to_s)
    [response.code, body]
  end


  def delete_request(url)
    response = nil
    begin
      final_url = @base_url + url
      response = RestClient.delete final_url, @header
    rescue RestClient::ExceptionWithResponse => err
      response = err.response
      body = JSON.parse(response.body.to_s)
    end
    [response.code, body]
  end
end