require 'boker_tov_bot/message_handlers/base_handler'

module BokerTovBot
  module MessageHandlers
    class NimrodHandler < BaseHandler
      def initialize(options = {})
        @regex = /.*(תום|שדמי).*/mi
        @responses = ["אקסטרייייייייים", "תשמע הגזמנו אתמול", "וואה"]
        super(options)
      end

      def match?(message)
        @regex.match(message.downcase) ? true : false
      end

      def response(message)
        reply_with_probability(0.5) do
          [:text, @responses.sample]
        end
      end
    end
  end
end
