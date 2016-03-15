class NotificationMailer < ActionMailer::Base
  default from: "no-reply@tiksterapp.com"

def comment_added(comment)
  @place = comment.place
  @place_owner = comment.user
  mail(to: @place_owner.email, subject: "A comment has been added to #{@place.name}")
end



end
