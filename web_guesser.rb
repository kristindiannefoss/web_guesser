require 'sinatra'
require 'sinatra/reloader'


x = Random.rand(0..100)

get '/' do
  "The SECRET NUMBER is #{x}"
end
