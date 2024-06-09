class ChangeContributionToArrayInUserDetails < ActiveRecord::Migration[6.0]
  def up
    unless column_exists?(:user_details, :contributions)
      add_column :user_details, :contributions, :string, array: true, default: [], null: false
    end

    # Migrate old data to new column
    UserDetail.reset_column_information
    UserDetail.find_each do |user_detail|
      if user_detail.read_attribute(:contribution).is_a?(String)
        user_detail.update_columns(contributions: [user_detail.read_attribute(:contribution)])
      end
    end
    
    if column_exists?(:user_details, :contribution)
      remove_column :user_details, :contribution
    end
  end

  def down
    unless column_exists?(:user_details, :contribution)
      add_column :user_details, :contribution, :string
    end

    # Migrate data back to old column
    UserDetail.reset_column_information
    UserDetail.find_each do |user_detail|
      if user_detail.contributions.is_a?(Array) && user_detail.contributions.any?
        user_detail.update_columns(contribution: user_detail.contributions.join(", "))
      end
    end

    if column_exists?(:user_details, :contributions)
      remove_column :user_details, :contributions
    end
  end
end
