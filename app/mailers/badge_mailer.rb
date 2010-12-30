class BadgeMailer < ActionMailer::Base
  default :from => "mike.abner@gmail.com"
  
  def badge_pinned_email(user, badge)
    @user = user
    @badge = badge
    @url = ''
    if production
      @url = 'http://the-badger.heroku.com/badges'
    else
      @url = 'http://localhost:3000/badges'
    end
    
    mail(:to => @user.email, :subject => "#{current_user.username} has pinned a badge on you at The Badger!")
  end
  
end
