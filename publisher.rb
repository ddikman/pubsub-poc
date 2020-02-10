require "google/cloud/pubsub"

TOPIC_NAME = "article-updates-topic"
PROJECT_NAME = ENV["PUBSUB_PROJ_NAME"]

pubsub = Google::Cloud::Pubsub.new project: PROJECT_NAME

topic = pubsub.topic TOPIC_NAME
topic.publish "This is a test message."

puts "Message published."