require 'boker_tov_bot/message_handlers/base_handler'
require 'faraday'
require 'faraday_middleware'
require 'tempfile'

module BokerTovBot
  module MessageHandlers
    class HatulaHandler < BaseHandler
      def initialize(options = {})
        @regex = /.*(חתולה).*/mi
        @image_url = "http://thecatapi.com/api/images/get"
        @image_conn = Faraday.new(
          url: @image_url
        ) do |conn|
          conn.use FaradayMiddleware::FollowRedirects, limit: 5
          conn.adapter Faraday.default_adapter
        end
        @fetch_retries = 3
      end

      def match?(message)
        @regex.match(message.downcase) ? true : false
      end

      def response(message)
        retries = @fetch_retries
        begin
          [:image, get_image]
        rescue Exception => e
          retries = retries - 1
          if retries >= 0
            [:image, get_image]
          else
            [nil, nil]
          end
        end
      end

      def get_image
        tmpfile = Tempfile.new
        image_resp = @image_conn.get do |req|
          req['type'] = 'png'
          req['size'] = 'medium'
        end
        if !image_resp.success?
          raise RuntimeError, "could not get image, #{image_resp.status}, #{image_resp.body}"
        end
        File.write(tmpfile.path, image_resp.body)
        tmpfile.flush
        file_io = Faraday::UploadIO.new(tmpfile.path, 'image/png')
        tmpfile.close
        file_io
      end
    end
  end
end
