# Validate environment variables
def get_env!(key)
  if ENV.has_key?(key) && !ENV[key].to_s.empty?
    ENV[key]
  else
    raise ArgumentError, "Missing environment variable '#{key}'!"
  end
end

current_dir    = File.dirname(__FILE__)
orgname        = get_env!('ORGNAME')
username       = get_env!('USER')
chef_repo_path File.join(current_dir, '..')

chef_server_url "https://api.opscode.com/organizations/#{orgname}"
node_name       username
client_key      File.join(
                          File.expand_path(ENV['HOME']),
                          '.chef', "#{username}.pem"
                         )

use_policyfile   true
deployment_group 'chefconf-demo-provisioner'
