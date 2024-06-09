class CreateUserDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :contact_details
      t.text :contributions, default: "[]", null: false
      t.string :contact_options
      t.timestamps
    end
  end
end