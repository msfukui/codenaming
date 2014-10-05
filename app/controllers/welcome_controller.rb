class WelcomeController < ApplicationController

  def index
  end

  private
    def welcome_params
      params.require(:welcome).permit(:index)
    end
end
