class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :notes, type: String

  has_many :comments, dependent: :destroy
end
