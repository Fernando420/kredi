class CreateInvoicesMassive
  require 'zip'
  attr_accessor :zip_file, :file, :data, :user,:success,:failed

  def self.create(zip_file,file,user)
    cs = self.new
    cs.zip_file = zip_file
    cs.file = file
    cs.user = user
    cs.data = nil
    cs.success = []
    cs.failed = []
    cs.generate
  end

  def generate
    process_status
    puts self.file.tempfile
    puts self.file.tempfile.class
    Zip::File.open(self.file.tempfile) do |file_xml|
        puts file_xml
      file_xml.entries.each do |item|
        puts item
        if item.name.split('/').count == 2
          self.data = Hash.from_xml(file_xml.read(item.name))
          create_emitter unless emitter
          create_receiver unless receiver
          invoice = self.zip_file.invoices.create(body_invoice)
          self.success << body_invoice if invoice.valid?
          self.failed << body_invoice if invoice.invalid?
        end
      end
    end
    zip_file.update({
        status: 'process',
        success: self.success,
        failed: self.failed
    })
  end

  def process_status
    zip_file.update({status: 'processing'})
  end

  def emitter
    Emitter.find_by_rfc(self.data['hash']['emitter']['rfc'])
  end

  def receiver
    Receiver.find_by_rfc(self.data['hash']['receiver']['rfc'])
  end

  def create_emitter
    Emitter.create(self.data['hash']['emitter'])
  end

  def create_receiver
    Receiver.create(self.data['hash']['receiver'])
  end

  def body_invoice
    {
      currency: self.data['hash']['amount']['currency'],
      user: self.user,
      emitter: emitter,
      receiver: receiver,
      amount: self.data['hash']['amount']['cents'].to_f,
      emitted_at:  self.data['hash']['emitted_at'],
      expires_at: self.data['hash']['expires_at'],
      signed_at: self.data['hash']['signed_at'],
      invoice_uuid: self.data['hash']['invoice_uuid'],
      cfdi_digital_stamp: self.data['hash']['cfdi_digital_stamp'],
      status: set_status
    }
  end

  def set_status
    case self.data['hash']['status']
    when 'active'
      'actived'
    else
      'inactived'
    end
  end


end