require "google/cloud/pubsub"

TOPIC_NAME = "article-updates-topic"

pubsub = Google::Cloud::Pubsub.new

topic = pubsub.topic TOPIC_NAME
topic.publish "This is a test message."

puts "Message published."
