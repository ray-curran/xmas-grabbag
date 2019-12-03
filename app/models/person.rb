class Person < ActiveRecord::Base
  belongs_to :family
  has_many :pairs
  has_many :gifts, through: :pairs

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end
