require 'rspec/core/rake_task'
require 'foodcritic'
require 'rubocop/rake_task'
require 'rake/clean'

FoodCritic::Rake::LintTask.new do |task|
  task.options = { fail_tags: ['any'], progress: true, context: true }
end

RuboCop::RakeTask.new do |task|
  task.options = %w(--display-cop-names --auto-correct)
end

RSpec::Core::RakeTask.new(:spec) do |task|
end

task :all do
  puts 'lets test this shit'
end

test_results_dir = ENV['TEST_RESULTS_DIR'] || 'test_results'

CLEAN.include('vendor/cookbooks/cookbook-testing/*')
CLOBBER.include(test_results_dir)

directory test_results_dir
server_url = 'https://sandbox-v2.chef.ops.yahoo.com/organizations/y7_tech'
ssh_user = 'y7_tech_chef'
sd_job = 'sd244104'
sd_key = '/tmp/screwdriver/sd244104.pem'

namespace :serverspec do
  roles = ENV['CHEF_QUERY'].split(",")
  roles.each do |role|
    hosts = []
    knife_ssh_command = "knife ssh  'chef_environment:#{ENV['CHEF_ENV']} AND (role:#{role})' 'hostname' --format json --server-url #{server_url} --user #{sd_job} --key #{sd_key} --ssh-user #{ssh_user} --concurrency 1  --exit-on-error"
    hosts_string = %x[ #{knife_ssh_command} ]
    # hosts = `hostname`
    hosts += hosts_string.split(" ").uniq
    specfiles = "test/integration/default/serverspec/#{role}/*_spec.rb"
    puts "hosts: #{hosts}"
    puts "role: #{role}"
    task :all => hosts.map {|h| 'serverspec:' + h.split('.')[0] }
    hosts.each do |host|
      short_name = host.split('.')[0]
      # role = short_name.match(/[^0-9]+/)[0]
      desc "Run serverspec to #{host}"
      puts "Run serverspec to #{host}"
      RSpec::Core::RakeTask.new(short_name) do |t|
        ENV['TARGET_HOST'] = host
        t.pattern = specfiles
      end
    end
  end
end

task default: [:foodcritic, :rubocop, :spec]
task post_deploy: [:all, "serverspec:all"]
