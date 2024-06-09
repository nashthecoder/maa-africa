class ChangeContributionToArrayInUserDetails < ActiveRecord::Migration[6.0]
  def up
    add_column :user_details, :contributions, :string, array: true, default: '{}', null: false
    UserDetail.reset_column_information
    UserDetail.find_each do |user_detail|
      user_detail.update(contributions: [user_detail.contribution])
    end
    remove_column :user_details, :contribution
  end

  def down
    add_column :user_details, :contribution, :string
    UserDetail.reset_column_information
    UserDetail.find_each do |user_detail|
      user_detail.update(contribution: user_detail.contributions.first)
    end
    remove_column :user_details, :contributions
  end
end
