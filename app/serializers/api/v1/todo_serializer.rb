class Api::V1::TodoSerializer < Api::V1::BaseSerializer
	attributes  :title, :notes
	has_many :comments
end