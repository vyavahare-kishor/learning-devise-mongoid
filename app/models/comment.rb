class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks


  field :description, type: String

  belongs_to :todo, dependent: :destroy
end
