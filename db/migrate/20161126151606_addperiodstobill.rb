class Addperiodstobill < ActiveRecord::Migration
  def change
    add_column :bills, :from_date, :date
    add_column :bills, :to_date, :date
    add_column :bills, :pay_date, :date
  end
end
