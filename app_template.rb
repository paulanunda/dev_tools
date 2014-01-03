#################
# initial setup #
#################

remove_file 'README.rdoc'
create_file 'README.md'

gem_group :development, :test do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'rspec-rails'
  gem 'thin'
  gem 'bullet'
end

gem_group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
  gem 'unicorn'
end

run 'bundle install'

#################
# init git repo #
#################

# https://raw.github.com/github/gitignore/master/Rails.gitignore

ignore_list = '
.DS_Store

*.rbc
*.sassc
.sass-cache
capybara-*.html
.rspec
/log
/tmp
/db/*.sqlite3
/public/system
/coverage/
/spec/tmp
**.orig
rerun.txt
pickle-email-*.html
# config/initializers/secret_token.rb
# config/secrets.yml

## Environment normalisation:
/.bundle
/vendor/bundle

# these should all be checked in to normalise the environment:
# Gemfile.lock, .ruby-version, .ruby-gemset

# unless supporting rvm < 1.11.0 or doing something fancy, ignore this:
.rvmrc
'

git :init
append_file ".gitignore", ignore_list
git add: ".", commit: "-am 'initial commit'"

##############
# test suite #
##############

if yes? "Do you want to install rspec?"
  generate "rspec:install"
  git add: ".", commit: "-am 'installed rspec'"
end

###################
# root controller #
###################

# if yes? "Do you want to generate a root controller?"
#   name = ask("What should it be called?").underscore
#   generate :controller, "#{name} index"
#   route "root to: '#{name}\#index'"
#   git add: ".", commit: "-am 'added #{name} controller & root path'"
# end
