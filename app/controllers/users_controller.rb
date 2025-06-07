class UsersController < ApplicationController
before_action :set_user, only: %i[ show ]
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @journals = @user.journals
  end
   def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # Redirect to the course page
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        # Re-render the new course form. The view already contains
        # logic to display the errors in @course.errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :username, :role, :password_digest ])
    end
end
