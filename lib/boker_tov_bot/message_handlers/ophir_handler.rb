require 'boker_tov_bot/message_handlers/base_handler'

module BokerTovBot
  module MessageHandlers
    class OphirHandler < BaseHandler
      def initialize(options = {})
      @regex = /.*(אופיר|פיצות).*/mi
        @responses = ["אללה אופיר", "אללה אופיר איזה פיצות", "יומולדת לאופיר!", "איפה אופיר?!"]
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
