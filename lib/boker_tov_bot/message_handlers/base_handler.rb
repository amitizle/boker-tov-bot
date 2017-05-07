module BokerTovBot
  module MessageHandlers
    class BaseHandler
      def initialize(options = {})
      end

      def match?(message)
        raise NotImplementedError, "#{self.class.name}#match? wasn't implmeneted"
      end

      def response(message)
        raise NotImplementedError, "#{self.class.name}#response wasn't implmeneted"
      end
    end
  end
end
