source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# GLOBAL RUBY RAILS
gem 'rails', '~> 5.0.1'

#CSS
gem 'data-confirm-modal'
gem 'sass-rails'
gem 'select2-rails'
gem 'twitter-bootstrap-rails'

#JS
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-datatables-rails', '~> 3.4.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-validation-rails'
gem 'therubyracer'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

#ICONS
gem 'material_icons'
gem 'font-awesome-rails'

#IMAGES
gem 'paperclip', '~> 5.0.0'
gem 'flag_icon_css_rails'

#SERVER
gem 'puma', '~> 3.0'

#AUTHENTICATION
gem 'cancancan'
gem 'devise'
gem 'rolify'

#DATABASE
gem 'pg', '~> 0.18'

#EDITOR
gem 'wysiwyg-rails'

# GLOBALISATION & I18n
gem 'i18n-js', '3.0.0.rc2'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capistrano-rails'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'rails_12factor'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
