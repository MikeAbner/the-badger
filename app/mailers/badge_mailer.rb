class BadgeMailer < ActionMailer::Base
  default :from => "mike.abner@gmail.com"
  
  def badge_pinned_email(current_user, user, badge)
    @current_user = current_user
    @user = user
    @badge = badge
    @url = 'http://the-badger.heroku.com/badges'
    
    mail(:to => @user.email, :subject => "#{current_user.username} has pinned a badge on you at The Badger!")
  end
  
end
