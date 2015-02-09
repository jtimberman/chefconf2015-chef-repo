name            'chefconf-demo'
run_list        'chef-server-cluster::cluster-provision'
default_source  :community

cookbook        'chef-server-ingredient', '>= 0.0.0',
                :github => 'opscode-cookbooks/chef-server-ingredient'

cookbook        'chef-server-cluster', '>= 0.0.0',
                :github => 'opscode-cookbooks/chef-server-cluster'
