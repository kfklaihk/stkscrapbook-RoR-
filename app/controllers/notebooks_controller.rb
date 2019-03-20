class NotebooksController < ApplicationController
  before_action :authenticate_user
  before_action :set_notebook, only: [:show, :edit, :update, :destroy, :preview]
  include Rails.application.routes.url_helpers
  

  # GET /notebooks/new
  def new
    @notebook = current_user.notebooks.new
  end

  # GET /notebooks/1/edit
  def edit
  end

  # GET /notebooks/1/
  def show
  end

# GET /notebooks/1/
def preview
end

  # POST /notebooks
  # POST /notebooks.json
  def create

    @notebook = current_user.notebooks.build(notebook_params)
    @notebook.fileurl=rails_blob_url(@notebook.attachment, disposition: "attachment")
    if @notebook.save
  		flash[:success] = "Saved successfully"
  		redirect_to :controller => 'users',:id=>current_user.id, :action => 'notebooks'
  	else
  		render "new"
  	end
  end

  # PATCH/PUT /notebooks/1
  # PATCH/PUT /notebooks/1.json
  def update
    unless  params[:notebook][:attachment].nil?
      params[:notebook][:fileurl]=rails_blob_url(@notebook.attachment, disposition: "attachment") 
  end
      if @notebook.update(notebook_params)
        flash[:success] = "Updated successfully"
        redirect_to :controller => 'users',:id=>current_user.id, :action => 'notebooks'
      else
        render "edit"
      end
  end

  # DELETE /notebooks/1
  # DELETE /notebooks/1.json
  def destroy
    @notebook.destroy
    respond_to do |format|
      format.html { redirect_to :controller => 'users',:id=>current_user.id, :action => 'notebooks', notice: 'Notebook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = Notebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notebook_params
      params.require(:notebook).permit(:id,:user_id, :stkcode, :datme, :title, :category, :fmt, :fileurl, :attachment)
      
    end
end
