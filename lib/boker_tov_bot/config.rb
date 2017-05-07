require 'singleton'

module BokerTovBot
  class Config
    include Singleton
    attr_accessor :token

    def token
      @@token ||= ENV['TELEGRAM_BOT_TOKEN']
      @@token
    end
  end
end
