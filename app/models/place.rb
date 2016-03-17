class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :photos

  geocoded_by :address
  after_validation :geocode

  validates :name, :presence => {:message => " -Please enter the name of the bar-"}, :length => {:minimum => 2, :maximum => 100, :message => "-That name is to short or too long-"}
  validates :address, :presence => {:message => "-Please enter the address-"}, :format => {:with => /\A(?=.*[a-zA-Z])(?=.*[ ])(?=.*[0-9]).{15,}\z/, :message => "-Please enter a valid address-"}, :uniqueness => {:message => "-That adrress has already been added-"}
  validates :description, :presence => {:message => "-Please enter a little about this place-"}, :format => {:with => /\A(?=.*[a-zA-Z])(?=.*[ ]).{10,}\z/, :message => "-Can you tell us a little more, please?-"}, :length => {:maximum => 600, :message => "-Sorry, 600 characters max-"}
end
