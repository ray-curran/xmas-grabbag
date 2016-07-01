class Trade < ActiveRecord::Base
  has_many :pairs
  has_many :gifts, through: :pairs
end
