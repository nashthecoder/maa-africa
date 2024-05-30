class CreateUserDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :linkedin
      t.string :contribution
      t.text :content

      t.timestamps
    end
  end
end
