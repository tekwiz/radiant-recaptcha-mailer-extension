class MailController < ApplicationController
  include RecaptchaMailer
  
  no_login_required
  skip_before_filter :verify_authenticity_token  

  def create
    @page = Page.find(params[:page_id])
    @page.request, @page.response = request, response
    mail, config = process_mail(@page, request)

    if mail.sent?
      redirect_to (config[:redirect_to] || "#{@page.url}#mail_sent")
    else
      render :text => @page.render
    end
  end
end