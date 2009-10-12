module RecaptchaMailer
  include Recaptcha::Verification
  
  def process_mail( page, request )
    config, part_page = config_and_page(page)
    mail = Mail.new(part_page, config, request.parameters[:mailer])
    page.last_mail = part_page.last_mail = mail
    verify_recaptcha(:model => mail, :request => request)
    mail.send
    
    return [mail, config]
  end
  
protected

  def config_and_page( page )
    until page.part(:mailer) or (not page.parent)
      page = page.parent
    end
    string = page.render_part(:mailer)
    [(string.empty? ? {} : YAML::load(string).symbolize_keys), page]
  end
end