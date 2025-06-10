class TagsController < ApplicationController
  before_action :set_tag, only: %i[ edit update destroy ]
  before_action :require_admin, only: %i[ create edit update destroy ]
  def index
    @tags = Tag.all
  end
  def new
    @tag = Tag.new
  end
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_path, notice: "tag was successfully created." }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_path, notice: "tag was successfully updated." }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end

  end
  def destroy
    @tag.destroy!

    respond_to do |format|
      format.html { redirect_to tags_path, status: :see_other, notice: "tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.expect(tag: [:tag_name])
    end


end
