class TasksController < ApplicationController
    before_action :find_task_id, except: [:create]
    before_action :authenticate!
    before_action :authorize, only: [:destroy, :complete]

    def create
        task_params = params.require(:task).permit(:title, :description, :complete)
        @task = Task.new task_params
        @project = Project.find params[:project_id]
        @task.user = current_user

        @task.project = @project
        if @task.save
            redirect_to project_path(@project)
        else
            @tasks = @project.tasks.order(created_at: :desc)
            render 'projects/show', alert: "Unable to save the task"
        end
    end


    def destroy
        # @task = Task.find params[:id]
        @task.destroy
        redirect_to project_path(@task.project_id)        
    end

    def complete
        # @task = Task.find params[:id]
        if @task.complete == false
            @task.update(complete: true)
        else
            @task.update(complete: false)
        end
        redirect_to project_path(@task.project_id)
    end

    private
    
    def find_task_id
        @task = Task.find params[:id]
    end

    def authorize
        redirect_to root_path, alert: 'Not authorized' unless can?(:crud, @task)
    end
end
