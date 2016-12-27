class Comp < ActiveRecord::Base

  validates :name,:brand, presence: true

  has_one :currency

end
