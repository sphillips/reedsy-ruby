require 'sinatra'
require 'sinatra/reloader' if development?
require 'mongoid'
Dir["lib/*.rb"].each {|file| require_relative file }

configure do
  Mongoid.load!("./mongoid.yml")
end
