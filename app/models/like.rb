class Like < ActiveRecord::Base
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  belongs_to :user
  belongs_to :micropost
end
