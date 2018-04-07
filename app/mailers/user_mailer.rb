class UserMailer < ApplicationMailer
  default from: "Taobaobao <taobaobao99@gmail.com>"

  
  def notify_participate_create(user, post)
    
    @post = post
    @user = user

    mail to: user.email,
    subject: "Taobaobao | 已參加: #{post.title} 團購"
  end

  def notify_unparticipate_create(user, post)

    @post = post
    @user = user

    mail to: user.email,
    subject: "Taobaobao | 已退出: #{post.title} 團購"
  end
  
end
