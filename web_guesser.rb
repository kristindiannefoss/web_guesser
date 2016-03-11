require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = Random.rand(0..100)
OTHER_NUMBER  = Random.rand(0..100)

@@guess_count = 5
@@number      = SECRET_NUMBER
@@cheat       = ""

  get '/' do
    guess = params["guess"].to_i
    @@cheat = "the secret number is #{@@number}" if params["cheat"]
    @@guess_count -= 1
    if @@guess_count < 5
      if guess > @@number
        if guess > @@number + 5
          @@message = "way too high"
          @@color   = "red"
        else
          @@message = "too high"
          @@color   = "salmon"
        end
      elsif guess < @@number
        if guess < @@number - 5
          @@message = "way too low"
          @@color   = "red"
        else
          @@message = "too low"
          @@color   = "salmon"
        end
      elsif guess == @@number
        @@message   = "You got it right! The secret number is #{@@number}"
        @@color     = "green"
        @@number      = OTHER_NUMBER
      end
    else
      @@guess_count >= 5
      @@number      = OTHER_NUMBER
      @@message     = "You lose, the number has been reset"
    end
    erb :index, :locals => {:number => @@number, :message => @@message, :color => @@color, :cheat => @@cheat}
end
