class UserMailer < ApplicationMailer
  default from: "Taobaobao <taobaobao99@gmail.com>"

  def notify_participate_create(participate)
    
    @participate = participate

    mail to: participate.user.email,
    subject: "Taobaobao | 已參加: #{participate.post.title} 團購"
  end
end

