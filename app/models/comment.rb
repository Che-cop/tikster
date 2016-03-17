class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  validates :message, presence: true, length: { minimum: 3, maximum: 100}
  validates :rating, presence: true
  after_create :send_comment_email


  RATINGS ={
    "\u272F" => '1_star',
    "\u272F\u272F" => '2_star',
    "\u272F\u272F\u272F" => '3_stars',
    "\u272F\u272F\u272F\u272F" => '4_stars',
    "\u272F\u272F\u272F\u272F\u272F" => '5_stars'
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end

  def send_comment_email
      NotificationMailer.comment_added(self).deliver
  end
end
