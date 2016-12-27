class Project < ActiveRecord::Base
  has_many   :members
  has_many   :users, through: :members

  has_one :budgets, as: :budgetable

end
