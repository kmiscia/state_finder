require 'sinatra'
require_relative 'locator'
 
set :port, 8080

post '/' do
  Locator.find(params[:longitude], params[:latitude]).to_s + "\n"
end
