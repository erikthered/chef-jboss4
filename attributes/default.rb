default['jboss']['url'] = "http://sourceforge.net/projects/jboss/files/JBoss/JBoss-4.2.3.GA/jboss-4.2.3.GA-jdk6.zip"
default['jboss']['checksum'] = "48797e150ee7dd6e035290fab86f17a5fe7d174b4980e941b833369b80273620"
default['jboss']['version'] = "4.2.3.GA"
default['jboss']['user'] = "jboss"
default['jboss']['home'] = "/usr/local/jboss"

# Runtime options
default['jboss']['host'] = "0.0.0.0"
default['jboss']['configuration'] = "default"

case platform
when "redhat", "centos", "scientific", "fedora", "suse", "amazon"
	default['jboss']['initscript'] = "jboss_init_redhat.sh.erb"
when "debian", "ubuntu"
	default['jboss']['initscript'] = "jboss_init_ubuntu.sh.erb"
else
	default['jboss']['initscript'] = "jboss_init_redhat.sh.erb"
end
