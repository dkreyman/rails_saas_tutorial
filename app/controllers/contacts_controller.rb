class ContactsController < ApplicationController
  #GET request to /contact-us
  # Show new contact form
    def new
    @contact = Contact.new
  end

  #Post request /contacts
  def create
    #Mass assignment of form fields into contact object
    #@contact is used in the new.html.erb file
    @contact = Contact.new(contact_params)
    #Save the contact object to the database
    if @contact.save
        #Store form fields via paramaters, into variables
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
        #Plug variable into contact Mailer
        #email method and send email
        ContactMailer.contact_email(name, email, body).deliver
        #store success message in flash has
        flash[:success] = "Message Sent."
        #redirect to new action /contact-us
        redirect_to new_contact_path
    else
        #if contact object doesnt save store errors in flash hash
        #Message displayed in the application.html.erb file
        flash[:danger] = @contact.errors.full_messages.join(", ")
        #redirect to the new action
        redirect_to new_contact_path
    end
  end

  private
  #to collect data from form, we need to use
  #strong parameters and whitelist the form fields. Security feature.
    def contact_params
        params.require(:contact).permit(:name, :email, :comments)
    end
end