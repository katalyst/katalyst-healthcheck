require "sidekiq"

module Katalyst
  module Healthcheck
    module Actions
      class Sidekiq
        include Katalyst::Healthcheck::Monitored
        include ::Sidekiq::Worker

        sidekiq_options retry: false

        define_task :sidekiq_health, "Sidekiq background processing", interval: 60

        def perform
          Sidekiq.healthy! :sidekiq_health
        end
      end
    end
  end
end
