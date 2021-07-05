class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    project = Project.find(params[:comment][:project_id])
    @comment.commentable = project
    if @comment.save
      flash[:success] = "Object successfully created"
      redirect_to project_path(@comment.commentable)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :project)
  end
end
