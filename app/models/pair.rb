class Pair < ActiveRecord::Base
  belongs_to :recipient, class_name:'Person'
  belongs_to :giver, class_name:'Person'
  belongs_to :trade
  has_many :gifts
end
