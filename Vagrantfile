Vagrant.configure("2") do |config|

  # This is a common base box with a 40GB hard drive. Bento is a Chef project
  # and can be generally trusted. 
  config.vm.box = "bento/ubuntu-12.04"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Mount the colonel project it the expected production web root.
  config.vm.synced_folder ".", "/opt/code"
  
  # Configure Virtualbox parameters around certain desired attributes
  # of the guest.
  config.vm.provider "virtualbox" do |vb|
    # Keep the VM small. 
    vb.memory = "512"
  end

  # Shell provider is used for simplicity and as a better comparison for 
  # Dockerfile
  config.vm.provision "shell", inline: <<-SHELL
    # Install packages
    apt-get update -yq
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      build-essential \
      python-dev \
      python-pip \
      redis-server
    
    # Install our python dependencies
    # Really shoudl be using virtualenv for dependency separation which
    # adds another layer of complexity to the config you don't see with 
    # Docker
    pip install -r /opt/code/requirements.txt
    python /opt/code/app.py
  SHELL
end
