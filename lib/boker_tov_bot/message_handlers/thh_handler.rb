require 'boker_tov_bot/message_handlers/base_handler'

module BokerTovBot
  module MessageHandlers
    class ThhHandler < BaseHandler
      def initialize(options = {})
        @regex = /.*\bט+ח+\b.*/mi
        super(options)
      end

      def match?(message)
        @regex.match(message.downcase) ? true : false
      end

      def response(message)
        reply_with_probability(1.0) do
          [:text, message.downcase.gsub('ט', 'פ').gsub('ח', 'ף')]
        end
      end
    end
  end
end
