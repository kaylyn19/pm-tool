class TasksController < ApplicationController
    def create
        task_params = params.require(:task).permit(:title, :description, :complete)
        @task = Task.new task_params
        @project = 
    end

    def destroy
    end

    private

    def find_id
    end
end
