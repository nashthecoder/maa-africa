class UserDetail < ApplicationRecord
    default_scope { where.not(contributions: []) }  # Ensures contributions is never empty
    validates :contributions, presence: true
end