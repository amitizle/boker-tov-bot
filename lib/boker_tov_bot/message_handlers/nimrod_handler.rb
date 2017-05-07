require 'boker_tov_bot/message_handlers/base_handler'

module BokerTovBot
  module MessageHandlers
    class NimrodHandler < BaseHandler
      def initialize(options = {})
        @regex = /.*(נימי|נמרוד|נימרוד|ניסים|נסים).*/mi
        @responses = ["פרושיאנטה", "רדיוהד", "סורי נרדמתי"]
      end

      def match?(message)
        @regex.match(message.downcase) ? true : false
      end

      def response(message)
        [:text, @responses.sample]
      end
    end
  end
end
