class ContactsController < ApplicationController
  def new
    @contact= Contact.new
    
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if @contact.deliver
        flash.now[:success] = 'Message sent!'
      else
        flash.now[:error] = 'Could not be sent'
        render :new
      end
  end
end
