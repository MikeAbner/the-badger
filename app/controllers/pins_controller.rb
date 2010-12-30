class PinsController < ApplicationController
  before_filter :authenticate_user!
  
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
      BadgeMailer.pinned_badge_email(@user, @badge).deliver
      redirect_to root_path
    else
      flash[:alert] = "Oh no!  Something went wrong.  Try again"
      render :action => 'new'
    end
  end
end
