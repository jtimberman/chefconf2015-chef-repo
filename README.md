![img](http://www.troll.me/images/xzibit-yo-dawg/yo-dawg-i-heard-you-like-turtles-so-we-put-a-turtle-on-a-turtle-so-you-can-ride-a-turtle-thats-riding-a-turtle.jpg)

# ChefConf 2015 - Chef Provisioning Chef Server Cluster

This is the development repository for my talk on using Chef Provisioning to build a Chef Server 12 cluster.

It is based on my [blog post](https://www.chef.io/blog/2014/12/15/sysadvent-day-14-using-chef-provisioning-to-build-chef-server/) on the subject.

This repository is not supported by Chef Software, Inc. It may work on your system(s) with or without modification.

# Abstract

Or, "Yo dawg, I heard you like Chef!"

This talk is an exploration of how to build Chef Server 12 clusters with Chef Provisioning, including premium features like Chef Reporting and Chef Analytics. In this talk, I will cover several new capabilities and tools in the Chef ecosystem that makes it easier than ever before to build and manage scalable Chef Server clusters.

In this talk, attendees will learn:

* The basics of Chef Provisioning
* How Chef Provisioning works with EC2
* The chef-server-cluster cookbook
* How Chef's Policyfile feature is a great workflow for this use case
* How to use data to drive configuration of Chef Server clusters
* How the various premium features of Chef Server integrate across multiple nodes

# Using This Repository

You're welcome to try and use this repository on your own systems, but there are likely things you'll need to change, since it was built specifically for my ChefConf demonstration's use case.

That said, here are the steps I took to set up to be able to use this repository and run the demonstration.

I'm working from my workstation laptop. I have installed ChefDK 0.4.0, and ChefDK's Ruby is my Ruby environment. I'm using Hosted Chef as the Chef Server, and this is configured in the `./.chef/config.rb` in this repository. I've generalized the configuration using environment variables that need to be set to use it. My user's API key is stored in `~/.chef/jtimberman.pem`.

In order for the provisioning recipes to work, the provisioning node needs to be created and have permissions to update the appropriate objects in the organization. This is done with the [knife-acl plugin](https://github.com/chef/knife-acl). The following commands will:

```sh
chef gem knife-acl
knife group create provisioners

for i in read create update grant delete
do
  knife acl add containers clients $i group provisioners
done

for i in read create update grant delete
do
  knife acl add containers nodes $i group provisioners
done

knife client create -d chefconf-provisioner > ~/.chef/chefconf-provisioner.pem
knife node create -d chefconf-provisioner
knife actor map
knife group add actor provisioners chefconf-provisioner

knife vault create secrets dnsimple -M client -J data_bags/secrets/dnsimple.json -A jtimberman -S 'name:chefconf-provisioner'
```

```
% CHEF_NODE=chefconf-provisioner chef-client -c .chef/config.rb
% DEPLOYMENT_GROUP=dnsimple-register CHEF_NODE=chefconf-provisioner chef-client -c .chef/config.rb
```

Then to tear down the cluster and remove DNS entries:

```
% DEPLOYMENT_GROUP=cleanup-provisioner CHEF_NODE=chefconf-provisioner chef-client -c .chef/config.rb
```

# License and Author

- Author: Joshua Timberman <joshua@chef.io>
- License: Apache Software License v2.0, see [LICENSE](LICENSE).
