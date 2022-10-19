class EmittersController < ApplicationController
 
  before_action :set_emitter, only: [:edit,:show,:update]

  def index
    @title = t('general_text.list_emitters')
    @emitters = Emitter.all
  end

  def new
    @title = t('general_text.new_emitters')
    @emitter = Emitter.new
  end

  def edit
    @title = t('general_text.edit_emitters')
  end

  def create
    @emitter = Emitter.new(emitter_params)
    if @emitter.save
      flash[:notice] = t('general_text.create_emitter_success')
      redirect_to receivers_path()
    else
      flash[:warning] = @emitter.errors.full_messages
      render :new
    end
  end

  def update
    if @emitter.update(emitter_params)
      flash[:notice] = t('general_text.create_emitter_success')
      redirect_to emitters_path()
    else
      flash[:warning] = @emitter.errors.full_messages
      render :action => :edit
    end
  end

  def show
    @title = t('general_text.show_emitters')
    respond_to do |format|
      format.js
    end
  end

  private

    def emitter_params
      params.require(:emitter).permit!
    end

    def set_emitter
      @emitter = Emitter.find(params[:id])
    end

end
