name            'cleanup'
run_list        'chef-server-cluster::cluster-clean', 'jtimberman-chefconf::cleanup'
default_source  :community

cookbook        'chef-server-ingredient', '>= 0.0.0',
                :github => 'opscode-cookbooks/chef-server-ingredient'

cookbook        'chef-server-cluster', '>= 0.0.0',
                :github => 'opscode-cookbooks/chef-server-cluster'

cookbook        'jtimberman-chefconf', '>= 0.0.0',
                :github => 'jtimberman/jtimberman-chefconf'
