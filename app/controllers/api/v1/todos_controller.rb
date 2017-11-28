class Api::V1::TodosController < Api::V1::BaseController
  respond_to :json

  def show
     todo = Todo.find(params[:id])
     render(json: Api::V1::TodoSerializer.new(todo).to_json)
     #render json: todo
  end

  def index
    if params[:search].nil?
      todos = Todo.includes(:comments).all
    else
      todos = Todo.search(params[:search]).records.includes(:comments)
    end
     render(
      json: ActiveModel::ArraySerializer.new(todos, each_serializer: Api::V1::TodoSerializer,
        root: 'todos',
      )
    )
    #render json: todos
  end
end