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

That said, the following will build the cluster and setup the DNS entries so the FQDNs work. This takes approximately 20 minutes.

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
