class ProjectController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
        @newTodo = Todo.find(params[:id])
    end

    def createProject
        @newProject = Project.create()
    end

    def createTodo
        @newTodo = Todo.new(todo_params)

        if @newTodo.save
            redirect_to root_path
        else
            render root_path
        end
    end

    private

    def todo_params
        params.require(:newTodo).permit(:text, :project_id)
    end
end




