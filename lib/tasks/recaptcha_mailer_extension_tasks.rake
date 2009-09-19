namespace :radiant do
  namespace :extensions do
    namespace :recaptch_mailer do
      desc "Runs the migration of the Recaptcha Mailer extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          RecaptchaMailerExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          RecaptchaMailerExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Recaptcha Mailer to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from RecaptchaMailerExtension"
        Dir[RecaptchaMailerExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(RecaptchaMailerExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end
    end
  end
end