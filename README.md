Mailer Extension for Radiant with reCAPTCHA Validation
======================================================

The Mailer extension enables form mail on a page.

**This extension is only compatible with Radiant 0.8.x**
  
Setup
-----

From your extensions directory (i.e. vendor/extensions)

    git clone git://github.com/tekwiz/radiant-recaptcha-mailer-extension.git recaptcha_mailer

If you would like reCAPTCHA functionality, you must install the [reCAPTCHA extension](http://github.com/tekwiz/radiant-recaptcha-extension).

Usage
-----

You can define email templates using pages parts (email, and/or email_html).
You configure the recipients and other Mailer settings in a "mailer" part:

    subject: From the website of Whatever
    from: noreply@example.com
    redirect_to: /contact/thank-you
    recipients:
      - one@one.com
      - two@two.com

The following tags are available to help you build the form:

    <r:mailer:form name=""> ... </r:mailer:form> 
    <r:mailer:text name="" /> 
    <r:mailer:checkbox name="" />
    <r:mailer:radio name="" />
    <r:mailer:radiogroup name=""> ... </r:mailer:radiogroup>
    <r:mailer:select name=""> ... </r:mailer:select>
    <r:mailer:date_select name=""/>
    <r:mailer:textarea name=""> ... </r:mailer:textarea>
    <r:mailer:option name="" />

When processing the form (in email and email_html), the following tags are 
available:

    <r:mailer:get name="" />
    <r:mailer:get_each name=""> ... </r:mailer:get_each>
      <r:mailer:index />

Simple example of a form:

    <r:mailer:form>
     <r:mailer:hidden name="subject" value="Email from my Radiant site!" /> <br/>
      Name:<br/>
     <r:mailer:text name="name" /> <br/>
      Message:<br/>
     <r:mailer:textarea name="message" /> <br/>
     <input type="submit" value="Send" />
    </r:mailer:form>
  
If you wish to add [recaptcha](http://www.recaptcha.net) validation, just install the [reCAPTCHA extension](http://github.com/tekwiz/radiant-recaptcha-extension) and add the tag to your form page.

User-provided Configuration
---------------------------

Sometimes, rather than explicitly configuring the recipients and such in the mailer part, you'd rather have them passed in by the person submitting the form. Mailer supports this by allowing you to specify a form field to pull the value from:

    from_field: my_form_field_that_contains_the_from_email_address
  
Then you just have to add that field to your mailer form and you're all set.

This is supported for the from `from_field`, recipients `recipients_field` and reply_to `reply_to_field` properties.

Enabling action_mailer
----------------------

In `environment.rb` you'll probably need to change:

    config.frameworks -= [ :action_mailer ]

to:

    config.frameworks -= []

Caveats
-------

Relative urls will almost certainly not work if the mailer fails validation. Solution? Only use absolute urls.

History
-------

    Added reCAPTCHA validation and change named to reCAPTHCA Mailer by: Travis "Tekwiz" Warlick - warlickt@operissystems.com
      Version: 1.0
      Contact: warlickt@operissystems.com

    Created by: M@ McCray - mattmccray.com
      Version: 0.2.1
      Contact: mmccray@elucidata.net

    Ported to 'mental' by: Sean Cribbs - seancribbs.com
      Version: 0.1
      Contact: seancribbs@gmail.com
  
    Seriously restructured by: Nathaniel Talbott - terralien.com
      Version: 0.2
      Contact: nathaniel@terralien.com
      Work sponsored by: Ignite Social Media, http://ignitesocialmedia.com/
  