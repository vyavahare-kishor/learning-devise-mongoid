class Api::V1::TodosController < Api::V1::BaseController
  respond_to :json

  def show
     todo = Todo.find(params[:id])
     render(json: Api::V1::TodoSerializer.new(todo).to_json)
     #render json: todo
  end

  def index
     todos = Todo.all
    #  render(
    #   json: ActiveModel::ArraySerializer.new(todos, each_serializer: Api::V1::TodoSerializer,
    #     root: 'todos',
    #   )
    # )
    render json: todos
  end
end