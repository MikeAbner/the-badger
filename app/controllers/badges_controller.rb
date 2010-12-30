require 'base64'

class BadgesController < ApplicationController
  def index
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
    if ! params[:badge][:image].nil?
      @badge.image_filename = params[:badge][:image].original_filename
      #@badge.image = params[:badge][:image].tempfile.read
    end
    
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
end
