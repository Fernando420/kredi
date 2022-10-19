class InvoicesController < ApplicationController

  before_action :set_invoice, only: [:edit,:show,:update,:destroy,:qr]

  def index
    @title = t('general_text.list_invoices')
    @invoices = Invoice.actived
  end

  def new
    @title = t('general_text.new_invoices')
    @invoice = Invoice.new
  end

  def edit
    @title = t('general_text.edit_invoices')
  end

  def qr
    send_data RQRCode::QRCode.new(@invoice.cfdi_digital_stamp).as_png(size: 300), type: 'image/png', disposition: 'attachment'
  end

  def new_massive
    @title = t('general_text.new_massive_invoices')
  end

  def create_massive
    zip_file = ZipFile.create({name: params[:file_zip].original_filename})
    CreateInvoicesMassive.create(zip_file,params[:file_zip],current_user)
    flash[:notice] = 'general_text.file_in_process'
    redirect_to invoices_path()
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)
    if @invoice.save
      flash[:notice] = t('general_text.create_invoice_success')
      redirect_to invoices_path()
    else
      flash[:warning] = @invoice.errors.full_messages
      render :new
    end
  end

  def update
    params[:invoice][:amount] = (params[:invoice][:amount].to_f * 100).to_i
    if @invoice.update(invoice_params)
      flash[:notice] = t('general_text.create_inovice_success')
      redirect_to invoices_path()
    else
      flash[:warning] = @invoice.errors.full_messages
      render :action => :edit
    end
  end

  def show
    @title = t('general_text.show_invoices')
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @invoice.update({status: 'deleted'})
    redirect_to invoices_path()
  end

  private

    def invoice_params
      params.require(:invoice).permit!
    end

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end


end
