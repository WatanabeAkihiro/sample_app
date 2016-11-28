class Tagging < ActiveRecord::Base
  belongs_to :comment
  belongs_to :micropost
end
