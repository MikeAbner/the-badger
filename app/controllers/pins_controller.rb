class PinsController < ApplicationController
  def new
    @pin = Pin.new
    @user = User.new
    @badge = Badge.find params[:badge_id]
  end
  def create
    @user = User.where(:email => params[:user][:email]).one
    @badge = Badge.find params[:badge][:id]
    
    @pin = Pin.new
    @pin.pinned_at = DateTime.now
    
    @pin.user = @user
    @pin.badge = @badge
    
    if @pin.save
      flash[:notice] = "You have pinned a badge on #{@user.email}!"
      redirect_to root_path
    else
      flash[:alert] = "Oh no!  Something went wrong.  Try again"
      render :action => 'new'
    end
  end
end