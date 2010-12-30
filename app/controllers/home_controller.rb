class HomeController < ApplicationController
  def index
    @badges = Badge.all
  end
end
