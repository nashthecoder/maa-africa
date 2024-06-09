class UserDetail < ApplicationRecord
    # default_scope { where.not(contributions: []) }  # Ensures contributions is never empty
    validates :contributions, presence: true
    validates :contact_details, presence: true
    validates :name, presence: true
end
