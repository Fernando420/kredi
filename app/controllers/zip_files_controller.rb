class ZipFilesController < ApplicationController

  before_action :set_zip_file, only: [:edit,:show,:update]

  def index
    @title = t('general_text.list_zip_files')
    @zip_files = ZipFile.all
  end

  def show
    @title = t('general_text.show_zip_files')
    respond_to do |format|
      format.js
    end
  end

  private

    def set_zip_file
      @zip_file = ZipFile.find(params[:id])
    end

end
