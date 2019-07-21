class ProjectsController < ApplicationController
    before_action :find_id, only: [:show, :destroy, :edit, :update]
    before_action :authenticate!, except: [:show, :index]
    before_action :authorize, only: [:destroy, :edit, :update]

    def new
        @project = Project.new 
    end

    def create
        @project = Project.new project_params
        @project.user = current_user

        if @project.save
            redirect_to project_path(@project), notice: "Saved!"
        else
            flash[:alert] = "error"
            render :new
        end
    end

    def show
        # @project = Project.find params[:id]
        @task = Task.new
        @tasks = @project.tasks.order(created_at: :desc)
        @discussions = @project.discussions.order(created_at: :desc)
    end

    def index
        if params[:tag]
            @tag = Tag.find_or_initialize_by(name: params[:tag])
            @project = @tag.projects.order(created_at: :desc)
        else
            @project = Project.all.order(created_at: :desc)
        end
    end

    def destroy
        # @project = Project.find params[:id]
        @project.destroy
        redirect_to projects_path
    end

    def edit
        # @project = Project.find params[:id]
    end

    def update
        # @project = Project.find params[:id]
        if @project.update project_params
            redirect_to project_path(@project), notice: 'updated!'
        else
            render :edit
        end
    end

    private
    
    def project_params 
        params.require(:project).permit(:title, :description, :due_date, :tag_name)
    end

    def find_id
        @project = Project.find params[:id]
    end

    def authorize
        redirect_to root_path, alert: 'Not authorized' unless can?(:crud, @project)
    end
end
