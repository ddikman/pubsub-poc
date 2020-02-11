require "google/cloud/pubsub"
require 'sinatra'

set :bind, '0.0.0.0'

TOPIC_NAME = "article-updates-topic"

pubsub = Google::Cloud::Pubsub.new

topic = pubsub.topic TOPIC_NAME

get '/' do
  puts "called root"
  "index"
end

get '/healthy' do
  puts "called healthy!"
  "healthy!"
end

get '/:data' do |data|
  topic.publish "Recieved: #{data}"
  puts "Message published: #{data}"
  "posted message: #{data}"
end
