class Topic < ActiveRecord::Base
  has_many :posts
  has_many :posts, dependent: :destroy
  has_many :labelings, as: :labelable
  # #14
  has_many :labels, through: :labelings

  has_one :rating, as: :rateable

  default_scope { order('created_at DESC') }
end
