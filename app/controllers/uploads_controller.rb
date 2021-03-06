class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  def remoted
    @upload = Upload.find(params[:id])
    @upload.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(upload_params)
    if !params[:file].blank?
      @upload.attachment = params[:file]
    end
    respond_to do |format|
      if @upload.save
        if @upload.attachment_type != 'batch_article_attachment'
          format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        else
          format.html { redirect_to '/articles/batch_upload/1', notice: t(:file_uploaded_successfully_we_will_get_back_to_you_after_processing) }
        end
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:uploadable_type, :uploadable_id, :token, :attachment, :attachment_type)
    end
end
