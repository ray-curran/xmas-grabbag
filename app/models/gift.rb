class Gift < ActiveRecord::Base
  belongs_to :pair
  belongs_to :trade, through: :pair
end
