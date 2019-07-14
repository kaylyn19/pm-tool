class ProjectsController < ApplicationController
    def new
        @project = Project.new # Idon't think this is needed here
    end

    def create
        project_params = params.require(:project).permit(:title, :description, :due_date)
        @project = Project.new project_params
        if @project.save
            redirect_to project_path(@project), notice: "Saved!"
        else
            flash[:notice] = "error"
            render :new
        end
    end

    def show
        @project = Project.find params[:id]
        @task = Task.new
        @tasks = @project.tasks.order(created_at: :desc)
        @discussion = Discussion.new
        @discussions = @project.discussions.order(created_at: :desc)
        @comment = Comment.new
        @comments = @discussion.comments.order(created_at: :desc)
    end

    def index
        @project = Project.all.order(created_at: :desc)
    end

    def destroy
        @project = Project.find params[:id]
        @project.destroy
        redirect_to projects_path
    end

    def edit
        @project = Project.find params[:id]
    end

    def update
        project_params = params.require(:project).permit(:title, :description, :due_date)
        @project = Project.find params[:id]
        if @project.update project_params
            redirect_to project_path(@project), notice: 'updated!'
        else
            render :edit
        end
    end
end
