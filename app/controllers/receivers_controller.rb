class ReceiversController < ApplicationController

  before_action :set_receiver, only: [:edit,:show,:update]

  def index
    @title = t('general_text.list_receivers')
    @receivers = Receiver.all
  end

  def new
    @title = t('general_text.new_receivers')
    @receiver = Receiver.new
  end

  def edit
    @title = t('general_text.edit_receivers')
  end

  def create
    @receiver = Receiver.new(receiver_params)
    if @receiver.save
      flash[:notice] = t('general_text.create_receiver_success')
      redirect_to receivers_path()
    else
      flash[:warning] = @receiver.errors.full_messages
      render :new
    end
  end

  def update
    if @receiver.update(receiver_params)
      flash[:notice] = t('general_text.create_receiver_success')
      redirect_to receivers_path()
    else
      flash[:warning] = @receiver.errors.full_messages
      render :action => :edit
    end
  end

  def show
    @title = t('general_text.show_receivers')
    respond_to do |format|
      format.js
    end
  end

  private

    def receiver_params
      params.require(:receiver).permit!
    end

    def set_receiver
      @receiver = Receiver.find(params[:id])
    end

end
