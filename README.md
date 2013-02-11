# chef-jboss4 cookbook

Installs JBoss application server version 4 (v4.2.3.GA by default). Should work on most Linux platforms that the Java and Ark cookbooks work on.

# Requirements

## Cookbooks

* Java (OpenJDK and Oracle installs should both work fine)
* Ark

# Usage

Pretty simple to use. Can be included in a run list or role.

# Attributes

## Install

* `node['jboss']['url']` - The URL for the zip distribution. The default is for 4.2.3.GA, but you could customize it for older versions of the 4.x JBoss server.
* `node['jboss']['checksum']` - SHA256 hash for the for zip distribution defined above.
* `node['jboss']['version']` - The version of the JBoss server. This is used for naming the install directory.
* `node['jboss']['user']` - The user that will run JBoss. Used for setting the permissions on the install directory.

## Runtime

* `node['jboss']['host']` - The host to run the server on. Default is 0.0.0.0.
* `node['jboss']['configuration']` - The server configuration to launch (minimal, default, all). 

# Recipes

## Default

Standard install using defaults of the 'default' server instance included with the zip distribution.

# Author

Author:: Erik Nelson (erik.david.nelson@gmail.com)
