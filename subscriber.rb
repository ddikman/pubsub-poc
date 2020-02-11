require "google/cloud/pubsub"

SUBSCRIPTION_NAME = "article-updates-sub"

pubsub = Google::Cloud::Pubsub.new

subscription = pubsub.subscription SUBSCRIPTION_NAME
subscriber   = subscription.listen do |received_message|
  puts "Received message: #{received_message.data}"
  received_message.acknowledge!
end

subscriber.start

# keep the program running, listening for messages
puts "keeping app alive.."
while true do
  sleep 5
end

puts "exiting.."
