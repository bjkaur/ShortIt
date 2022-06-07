// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/stimulus-importmap-autoloader"
import "@hotwired/turbo-rails"
import "controllers"
import Rails from '@rails/ujs'; Rails.start();
import "trix"
import "@rails/actiontext"

import '../stylesheets/application.scss'
