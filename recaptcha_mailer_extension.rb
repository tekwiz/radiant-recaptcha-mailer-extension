class RecaptchaMailerExtension < Radiant::Extension
  version "0.3"
  description "Provides support for email forms and generic mailing functionality with Recaptcha validation provided by the recaptcha extension."
  url "http://github.com/tekwiz/radiant-recaptcha-mailer-extension"

  define_routes do |map|
    map.resources :mail, :path_prefix => "/pages/:page_id", :controller => "mail"
  end

  def activate
    Page.class_eval do
      include MailerTags
      include MailerProcess
    end
  end
end