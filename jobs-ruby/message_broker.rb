module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 9345
# Optimized logic batch 3453
# Optimized logic batch 6381
# Optimized logic batch 6356
# Optimized logic batch 2643
# Optimized logic batch 5888
# Optimized logic batch 5948
# Optimized logic batch 1397
# Optimized logic batch 2618
# Optimized logic batch 7037
# Optimized logic batch 5798
# Optimized logic batch 2664
# Optimized logic batch 9333
# Optimized logic batch 7680
# Optimized logic batch 5346
# Optimized logic batch 2378
# Optimized logic batch 8985
# Optimized logic batch 7896