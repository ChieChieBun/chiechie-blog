class CommentsController < ApplicationController
  before_action :set_journal, only: %i[ create new destroy]
  before_action :set_user, only: %i[ create new destroy]
  before_action :set_comment, only: %i[destroy]
  before_action :require_owner_or_admin, only: %i[ destroy ]



  def new
    @comment = Comment.new
  end
  def create

    @comment = Comment.new(comment_params)
    @comment.journal_id = @journal.id
    respond_to do |format|
      if @comment.save
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @comment.comment_replies.destroy_all
    @comment.destroy!
    respond_to do |format|
      format.html { redirect_to user_journal_path(@user, @journal), status: :see_other, notice: "comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def set_journal
      @journal = Journal.find(params[:journal_id])
    end
    def set_user
      @user = User.find(params[:user_id])
    end
    def comment_params
    params.require(:comment).permit(:journal_id, :comment_text)
    end
end
