require 'boker_tov_bot/message_handlers/base_handler'

module BokerTovBot
  module MessageHandlers
    class YaronHandler < BaseHandler
      def initialize(options = {})
        @regex = /.*ירון.*/mi
        @responses = ["טחח", "יא ז׳וז׳ו טחח", "פףף", "מה נז׳מע", "חתולה"]
        super(options)
      end

      def match?(message)
        @regex.match(message.downcase) ? true : false
      end

      def response(message)
        reply_with_probability do
          [:text, @responses.sample]
        end
      end
    end
  end
end
