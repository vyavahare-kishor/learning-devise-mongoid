class Api::V1::TodoSerializer < Api::V1::BaseSerializer
	attributes :id, :title, :notes
end