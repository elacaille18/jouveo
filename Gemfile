source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '5.2.4.3'
gem 'puma'
gem 'pg'
gem 'figaro'
gem 'jbuilder', '~> 2.6', '>= 2.6.4'
gem 'devise', '>= 4.4.2'
gem 'redis'

gem 'sass-rails', '>= 5.0.5'
gem 'jquery-rails', '>= 4.1.1'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'simple_form', '>= 4.0.0'
gem 'autoprefixer-rails'

#locales
gem 'i18n'
gem 'devise-i18n'
gem 'devise-i18n-views'

# Policies
gem 'pundit', '>= 1.1.0'

# Seed
gem 'faker'

# Upload
gem 'cloudinary'
gem 'carrierwave', '>= 0.11.2'

# Mailer
gem 'postmark-rails', '>= 0.12.0'

# Sweet alerts
source "https://rails-assets.org" do
  gem 'rails-assets-sweetalert'
end
gem 'sweet-alert-confirm'

# Select customs
gem 'chosen-rails', '>= 1.5.2'
gem 'bootstrap-chosen-rails'

# Admin interface
gem 'rails_admin', '>= 1.0.0'
#gem "rails_admin_pundit", :github => "sudosu/rails_admin_pundit"

# DateTime Picker
gem 'momentjs-rails', '~> 2.11', '>= 2.11.1', :github => 'derekprior/momentjs-rails'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
# gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'

# search
gem "algoliasearch-rails"

group :development, :test do
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'quiet_assets', '>= 1.1.0'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'spring'

  gem "letter_opener"

end

group :production do
  gem 'rails_12factor'
end
