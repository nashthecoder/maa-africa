class Symptom
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :logged_at, type: Time
  field :notes, type: String
  belongs_to :user
end
