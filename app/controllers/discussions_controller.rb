class DiscussionsController < ApplicationController
    def new
        @project = Project.find params[:project_id]
        @discussion = Discussion.new
    end

    def create
        @project = Project.find params[:project_id]
        # @task = Task.find params[:id]
        @discussion = Discussion.new discussion_params
        @discussion.project = @project
        if @discussion.save
            redirect_to project_path(@project)
        else
            @discussions = @project.discussions.order(created_at: :desc)
            render :new
        end
    end

    def destroy
        @discussion = Discussion.find params[:id]
        if @discussion.destroy
            redirect_to project_path(@discussion.project_id), notice: "Discussion successfully deleted!"
        else
            redirect_to project_path(@discussion.project_id), alert: "The post could not be deleted"
        end
    end

    def edit
    end

    def update
    end

    private

    def discussion_params
        params.require(:discussion).permit(:title, :description)
    end
end
