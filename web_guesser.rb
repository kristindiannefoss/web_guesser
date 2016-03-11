require 'sinatra'
require 'sinatra/reloader'


x = Random.rand(0..100)

get '/' do
  erb :index, :locals => {:number => number}

end
