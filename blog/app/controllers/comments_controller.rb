class CommentsController < ApplicationController
  before_action :get_parent
  http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

  def new
    @comment = @parent.comments.build
  end

  def create
    @comment = @parent.comments.build(params[:comment])
     
    if @comment.save
      redirect_to article_path(@comment.article), :notice => 'Thank you for your comment!'
    else
      render 'new'
    end
  end
  


  def destroy
    @comment = @parent.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@parent)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  protected
   
  def get_parent
    @parent = Article.find_by_id(params[:article_id]) if params[:article_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end

end
