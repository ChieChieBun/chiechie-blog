class CommentRepliesController < ApplicationController
  before_action :set_journal, only: %i[ create new destroy]
  before_action :set_user, only: %i[ create new destroy]
  before_action :set_comment, only: %i[ create new destroy]
   before_action :set_comment_reply, only: %i[ destroy]
  before_action :require_owner_or_admin, only: %i[ destroy ]



  def new
    @comment_reply = CommentsReply.new
  end
  def create
    @comment_reply = CommentReply.new(comment_reply_params)
    @comment_reply.comment_id = @comment.id
    respond_to do |format|
      if @comment_reply.save
        format.json { render :show, status: :created, location: @comment_reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment_reply.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy

    @comment_reply.destroy!
    respond_to do |format|
      format.html { redirect_to user_journal_path(@user, @journal), status: :see_other, notice: "comment reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_comment_reply
      @comment_reply = CommentReply.find(params[:id])
    end
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end
    def set_journal
      @journal = Journal.find(params[:journal_id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end
    def comment_reply_params
    params.require(:comment_reply).permit(:comment_id, :comment_reply_text)
    end
end
