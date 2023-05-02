module Api
  module V1
    class GreetingsController < ApplicationController
      def random
        greetings = Greeting.all
        random_greeting = greetings.sample
        render json: random_greeting
      end
    end
  end
end
