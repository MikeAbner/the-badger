class BadgesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin_user, :only => [:new, :edit, :create, :update, :destroy]
  
  def index
    @pins = current_user.pins
    @badges = @pins.map { |p| p.badge }
  end
  def show
    @badge = Badge.find params[:id]
  end
  def new
    @badge = Badge.new
  end
  def edit
    @badge = Badge.find params[:id]
  end
  def create
    @badge = Badge.new(params[:badge])
    
    if @badge.save
      redirect_to root_path
    else
      flash[:alert] = 'Could not save the Badge!  Please try again.'
      render :action => 'new'
    end
  end
  def update
    @badge = Badge.find(params[:id])
    
    if @badge.update_attributes(params[:badge])
      redirect_to root_path
    else
      flash[:alert] = "Could not save the Badge!  Please try again."
      render :action => 'new'
    end
    
  end
  def destroy
    Badge.delete params[:id]
    redirect_to root_path
  end
  def badge_image
    @badge = Badge.find params[:id]
    
    pp @badge.image_content_type
    send_data(@badge.image_data, :type => @badge.image_content_type, :disposition => 'inline')
  end
end
