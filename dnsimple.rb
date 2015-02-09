name           'dnsimple'
run_list       'jtimberman-chefconf'
default_source :community

cookbook       'jtimberman-chefconf', '>= 0.0.0',
               :github => 'jtimberman/jtimberman-chefconf'

