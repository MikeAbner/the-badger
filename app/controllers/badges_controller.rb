class BadgesController < ApplicationController
  def new
    @badge = Badge.new
  end
end
