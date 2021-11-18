class AddCodeToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :code, :string
    add_index :companies, :code, unique: true
  end
end
