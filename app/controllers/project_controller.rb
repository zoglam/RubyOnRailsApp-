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

        if @newTodo.save
            redirect_to root_path
        else
            render root_path
        end
    end

    def completedTodo
        @currTodo = Todo.find(todo_param_id[:id])
		@currTodo.update_attributes(todo_param_isCompleted)
		redirect_to root_path
    end

    private

    def todo_params
        params.require(:newTodo).permit(:text, :project_id)
    end   

    def todo_param_isCompleted
        params.require(:completedTodo).permit(:isCompleted)
    end

    def todo_param_id
        params.require(:completedTodo).permit(:id)
    end

end




