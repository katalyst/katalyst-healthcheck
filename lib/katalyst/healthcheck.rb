# frozen_string_literal: true

require "rails"
require "active_support"
require "active_model"
require "redlock"

require "katalyst/healthcheck/version"
require "katalyst/healthcheck/railtie" if defined?(Rails)
require "katalyst/healthcheck/config"
require "katalyst/healthcheck/store/memory"
require "katalyst/healthcheck/store/redis"
require "katalyst/healthcheck/task"
require "katalyst/healthcheck/monitored"
require "katalyst/healthcheck/route"

module Katalyst
  module Healthcheck
    class << self
      def config
        @config ||= Config.new
      end

      def configure
        instance_eval(&:block)
      end
    end
  end
end
