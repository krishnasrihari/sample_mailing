require 'rubygems'
require 'spork'
require 'email_spec'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

ENV['RAILS_ENV'] = 'test'
require 'rails/application'

Spork.prefork do
  ActiveSupport::Dependencies.clear
  Spork.trap_method(Rails::Application, :reload_routes!)
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/*.rb")].each {|f| require f}
  FactoryGirl.reload
end
