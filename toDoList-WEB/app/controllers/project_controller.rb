class ProjectController < ApplicationController
    def index
        @projects = Project.all.order(:id)
        @todos = Todo.all.order(:id)

        @projectJSON = Project.all
        respond_to do |format|
            format.html {}
            format.json { render :json => @projectJSON.to_json(:include => :todos)}
        end
    end

    def show
        @project = Project.find(params[:id])
        @newTodo = Todo.find(params[:id])
    end

    def create
        @newTodo = Todo.create(todo_params)
        @newTodo.isCompleted = false
        @newTodo.save
        redirect_to root_path
    end

    def update
        @currTodo = Todo.find(todo_param_isCompleted)
		if @currTodo.isCompleted == false
            @currTodo.isCompleted = true
          else
            @currTodo.isCompleted = false
          end
          @currTodo.save
    end

    private

    def todo_params
        params.require(:newTodo).permit(:text, :project_id)
    end   

    def todo_param_isCompleted
        params[:id]
    end

end




