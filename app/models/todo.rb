class Todo
  include Mongoid::Document
  field :title, type: String
  field :notes, type: String
end
