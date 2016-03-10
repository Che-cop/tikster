class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

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
end
