require 'elasticsearch/model'
class Todo
	include Mongoid::Document
	include Mongoid::Timestamps
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	field :title, type: String
	field :notes, type: String

	has_many :comments, dependent: :destroy

	mappings dynamic: 'false' do
		indexes :title, type: 'string'
		indexes :notes, type: 'string'
		indexes :comments do
			indexes :description, type: 'string'
		end
	end

	#Todo.__elasticsearch__.create_index! force: true
	#Todo.__elasticsearch__.delete_index! force: true
	#Article.__elasticsearch__.refresh_index!
	#curl -X DELETE 'http://localhost:9200/_all'
	#curl -XDELETE http://localhost:9200/app_name/resource/123
	#curl -XDELETE http://localhost:9200/app_name

	def as_indexed_json(options={})
		self.as_json({only: [:id, :title, :notes],
				methods: [:availabilities, :specializations_id],
				include: {comments: {only: [:description]}}
			})
	end

	def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        multi_match: {
          query: query,
          fields: ['title', 'notes', 'comments.description']
        }
      }
    }
  )
end

end
