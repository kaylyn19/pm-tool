class ProjectsController < ApplicationController
    def new
        @project = Project.new # Idon't think this is needed here
    end

    def create
        project_params = params.require(:project).permit(:title, :description, :due_date)
        @project = Project.new project_params
        if @project.save
            flash[:notice] = "A new project is saved!"
            send plain: "saved!"
            # redirect_to project_path(@project.id)
        else
            # flash[:notice] = "error"
            render :new
        end
    end

    def show
    end
end
