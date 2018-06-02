class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user
  paginates_per 10
end
