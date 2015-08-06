class NotificationMailer < ActionMailer::Base
  default from: "no-reply@buzzoneapp.com"

  def comment_added
  	 mail(to: "forfastdemo@gmail.com",
         subject: "A comment has been added to your place")
  end

end
