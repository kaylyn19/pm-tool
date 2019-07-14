class DiscussionsController < ApplicationController
    before_action :find_id, except: [:new, :create]
    before_action :authenticate!, except: [:show]
    def new
        # @project = Project.find params[:project_id]
        @discussion = Discussion.new
    end

    def create
        @project = Project.find params[:project_id]
        @discussion = Discussion.new discussion_params
        @discussion.project = @project
        if @discussion.save
            redirect_to project_path(@project)
        else
            @discussions = @project.discussions.order(created_at: :desc)
            render :new
        end
    end

    def show
        # @discussion = Discussion.find params[:id]
        @comment = Comment.new
        @comments = @discussion.comments.order(created_at: :desc)
    end

    def destroy
        # @discussion = Discussion.find params[:id]
        if @discussion.destroy
            redirect_to project_path(@discussion.project_id), notice: "Discussion successfully deleted!"
        else
            redirect_to project_path(@discussion.project_id), alert: "The post could not be deleted"
        end
    end

    def edit
        # @discussion = Discussion.find params[:id]
    end

    def update
        # @discussion = Discussion.find params[:id]
        if @discussion.update discussion_params
            redirect_to project_path(@discussion.project_id), notice: "Discussion updated"
        else
            render :edit, alert: "Unable to update. Try again!"
        end
    end

    private

    def discussion_params
        params.require(:discussion).permit(:title, :description)
    end

    def find_id
        @discussion = Discussion.find params[:id]
    end
end
