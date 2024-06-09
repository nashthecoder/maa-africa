class UpdateUserDetailsSchema < ActiveRecord::Migration[6.0]
  def up
    # Add the new 'contributions' column as text
    add_column :user_details, :contributions, :text, default: '[]', null: false unless column_exists?(:user_details, :contributions)

    # Remove the 'linkedin' and 'content' columns if they exist
    remove_column :user_details, :linkedin if column_exists?(:user_details, :linkedin)
    remove_column :user_details, :content if column_exists?(:user_details, :content)
    
    # Rename 'contacts' to 'contact_details'
    rename_column :user_details, :contacts, :contact_details if column_exists?(:user_details, :contacts)

    # Add the 'contact_options' column
    add_column :user_details, :contact_options, :string unless column_exists?(:user_details, :contact_options)
  end

  def down
    # Reverse the changes
    remove_column :user_details, :contributions if column_exists?(:user_details, :contributions)
    add_column :user_details, :linkedin, :string unless column_exists?(:user_details, :linkedin)
    add_column :user_details, :content, :text unless column_exists?(:user_details, :content)
    rename_column :user_details, :contact_details, :contacts if column_exists?(:user_details, :contact_details)
    remove_column :user_details, :contact_options if column_exists?(:user_details, :contact_options)
  end
end
