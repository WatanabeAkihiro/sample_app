class Tag < ActiveRecord::Base
  has_many :adapters
  has_many :tags, through: :adapters
end
