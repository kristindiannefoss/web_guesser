require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = Random.rand(0..100)
def check_guess(guess)
end
# message = check_guess(guess)


  get '/' do
      guess = params["guess"].to_i
      if guess > SECRET_NUMBER
        if guess > SECRET_NUMBER + 5
          @@message = "way too high"
        else
          @@message = "too high"
        end
      elsif guess < SECRET_NUMBER
        if guess < SECRET_NUMBER - 5
          @@message = "way too low"
        else
          @@message = "too low"
        end
      elsif guess == SECRET_NUMBER
        @@message = "You got it right! The secret number is #{SECRET_NUMBER}"
      end
  erb :index, :locals => {:number => SECRET_NUMBER, :message => @@message}
  end
