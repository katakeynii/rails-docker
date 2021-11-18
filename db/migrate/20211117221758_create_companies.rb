class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
