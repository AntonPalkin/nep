class Ioe < ActiveRecord::Base

  has_one :budgets, as: :budgetable

end
