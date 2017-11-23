class Comment
  include Mongoid::Document
  include Mongoid::Timestamps


  field :description, type: String

  belongs_to :todo, dependent: :destroy
end
