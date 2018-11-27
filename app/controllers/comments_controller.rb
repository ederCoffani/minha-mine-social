class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

def create
  @posting= Posting.find(params[:posting_id])
  @comment = @posting.comments.create(comment_params)
  @comment.user_id = current_user.id
  if current_user
    if @comment.save
      return redirect_to postings_path
    else
     render 'new'
    end
  end
end
def destroy
  @comment.destroy
  respond_to do |format|
    format.js { render :nothing => true }
    format.html { redirect_to comentarios_url, notice: 'Comentario was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  def set_comment
    @comment = Comment.find params[:id]
  end
end
