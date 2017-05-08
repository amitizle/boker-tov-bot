require 'boker_tov_bot/message_handlers/base_handler'

module BokerTovBot
  module MessageHandlers
    class ThhHandler < BaseHandler
      def initialize(options = {})
        @regex = /.*\bט+ח+\b.*/mi
      end

      def match?(message)
        @regex.match(message.downcase) ? true : false
      end

      def response(message)
        [:text, message.downcase.gsub('ט', 'פ').gsub('ח', 'ף')]
      end
    end
  end
end
