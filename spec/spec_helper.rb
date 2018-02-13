require 'serverspec'
# require 'specinfra'
# include SpecInfra::Helper::Exec
# include SpecInfra::Helper::DetectOS
set :backend, :ssh
set :os, :family => 'redhat'
# set :os, :release => '6'
set :host, ENV['TARGET_HOST']
set :ssh_options, :user => 'y7_tech_chef'
set :path, '/sbin:/usr/local/sbin:$PATH'

# RSpec.configure do |c|
#   c.path = '/sbin:/usr/sbin'
#   if ENV['ASK_SUDO_PASSWORD']
#     require 'highline/import'
#     c.sudo_password = ask('Enter sudo password: ') { |q| q.echo = false }
#   else
#     c.sudo_password = ENV['SUDO_PASSWORD']
#   end
# end
