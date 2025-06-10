class JournalsController < ApplicationController
  before_action :set_journal, only: %i[ show ]
  before_action :set_user, only: %i[ show create new ]

 def index
  @user = User.find(params[:user_id])
  @journals = @user.journals
 end
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @journal = Journal.new
    @categories = Category.all
  end

  def show
    @user = User.find_by(params[:user_id])
    @category = @journal.category

  end
  def create
    @users = User.all
    @user = User.find(params[:user_id])
    @journal = Journal.new(journal_params)
    respond_to do |format|
      if @journal.save
        format.html { redirect_to user_journal_path(@user, @journal), notice: "Journal was successfully created." }
        format.json { render :show, status: :created, location: user_journal_path(@user, @journal) }
      else
        # Re-render the new course form. The view already contains
        # logic to display the errors in @course.errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
        @user = User.find(params[:user_id])
        @categories = Category.all

      end
    end
  end

    private
    def set_journal
    @journal = Journal.find(params[:id])
    end
    def set_user
    @user = User.find(params[:user_id])
    end
    def journal_params
      params.require(:journal).permit(:title, :category_id, :private, :entry, tag_ids:[])
    end
end
