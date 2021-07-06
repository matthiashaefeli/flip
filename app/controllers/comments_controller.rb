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

  def destroy
    # change this to get the path of each object. for now we only use comment with object
    comment = Comment.find(params[:id])
    project = comment.commentable
    comment.delete
    redirect_to project_path(project)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :project)
  end
end
