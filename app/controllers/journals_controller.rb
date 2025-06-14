class JournalsController < ApplicationController
  before_action :set_journal, only: %i[ show destroy update edit  ]
  before_action :set_user, only: %i[ show create new destroy update edit]
  before_action :require_owner, only: %i[new create edit update destroy ]

 def index

  @journals = @user.journals
 end
  def new
    @users = User.all
    @journal = Journal.new
    @categories = Category.all
  end

  def show

    @category = @journal.category

  end
  def create
    @users = User.all

    @journal = Journal.new(journal_params)
    @categories = Category.all
    respond_to do |format|
      if @journal.save
        tag_params[:tag_ids].each do |tag_id|
          JournalTagRelationship.create!({tag_id: tag_id, journal_id: @journal.id}) unless tag_id.empty?
        end
        format.html { redirect_to user_journal_path(@user, @journal), notice: "Journal was successfully created." }
        format.json { render :show, status: :created, location: user_journal_path(@user, @journal) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
        @user = User.find(params[:user_id])
        @categories = Category.all

      end
    end
  end
  def edit
    @users = User.all

    @categories = Category.all
  end
  def update
    @users = User.all
    @categories = Category.all
    @deletetags = JournalTagRelationship.where(journal_id:@journal)
    respond_to do |format|
      if @journal.update(journal_params)
        @deletetags.destroy_all
        tag_params[:tag_ids].each do |tag_id|
          JournalTagRelationship.create!({tag_id: tag_id, journal_id: @journal.id}) unless tag_id.empty?
        end
        format.html { redirect_to user_journal_path(@user, @journal), notice: "journal was successfully updated." }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
        @user = User.find(params[:user_id])
        @categories = Category.all
      end
    end
  end
  def destroy
    @journal.destroy!
    respond_to do |format|
      format.html { redirect_to user_path(@user), status: :see_other, notice: "tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_journal
      @journal = Journal.find(params[:id])
    end
    def set_user
      @user =@user = User.find(params[:user_id])
    end
    def journal_params
      params.require(:journal).permit(:user_id, :title, :category_id, :private, :entry, :tag)
    end
    def tag_params
      params.require(:tag).permit(tag_ids:[])
    end
end
