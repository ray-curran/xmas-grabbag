class Gift < ActiveRecord::Base
  belongs_to :pair
  has_one :recipient, through: :pair
  has_one :trade, through: :pair
end
