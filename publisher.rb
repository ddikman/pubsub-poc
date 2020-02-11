require "google/cloud/pubsub"
require 'sinatra'

TOPIC_NAME = "article-updates-topic"

pubsub = Google::Cloud::Pubsub.new

topic = pubsub.topic TOPIC_NAME

# runs default on port 4567
get '/:data' do |data|
  topic.publish "Recieved: #{data}"
  puts "Message published: #{data}"
end
