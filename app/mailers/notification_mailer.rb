class NotificationMailer < ActionMailer::Base
  default from: "no-reply@tiksterapp.com"

def comment_added
  mail(to: "jguymon2002@yahoo.com", subject: "A comment has been added to your place")
end



end
