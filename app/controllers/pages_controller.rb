class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
  end
end


#lancer migration depuis heroku : heroku run rails db:migrate
