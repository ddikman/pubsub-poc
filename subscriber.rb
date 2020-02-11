require "google/cloud/pubsub"

SUBSCRIPTION_NAME = "article-updates-sub"

pubsub = Google::Cloud::Pubsub.new

# wait to allow publisher to publish
sleep 60

puts "Listening.."

subscription = pubsub.subscription SUBSCRIPTION_NAME
subscriber   = subscription.listen do |received_message|
  puts "Received message: #{received_message.data}"
  received_message.acknowledge!
end

subscriber.start
# Let the main thread sleep for 60 seconds so the thread for listening
# messages does not quit
sleep 60
subscriber.stop.wait!
