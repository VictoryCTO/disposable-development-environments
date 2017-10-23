# Disposable Development Environments
## All Day DevOps - 2017

# Accompanying Resources

Stuff aobut he blog post at VictoryCTO

# Get Started 

The standard setup for following a Victory CTO tutorial is:

```bash
# Creates a workspace separate from your normal development area and allows 
# easier explanation of paths in blogs and instructions. 
mkdir -p ~/code/victory-cto && cd ~/code/victory-cto
```

Followed by cloning the repo:

```bash
# Get the source code including the runtime configuration
git clone git@github.com:VictoryCTO/disposable-development-environments.git
```

## Docker

```bash
# Build the development container
docker build -t my-local-runtime .

# Fire up the run time
docker run -p 5000:5000 -v $HOME/code/victory-cto/disposable-development-environments/:/code my-local-runtime

# Exercise the code
curl localhost:5000

```

Try changing the message locally on your workstation and exercising the
application again.


## Vagrant 

```bash
# Start the virtual machine
vagrant up

# configure the machine
vagrant provision

# Exercise the code
curl 192.168.33.10:5000

```

Try changing the message locally on your workstation and exercising the
application again.


# Handy Commands

Run from the container from a registry:

```
docker run -p 5000:5000 -v $HOME/code/victory-cto/disposable-development-environments/:/code quay.io/boyd/disposable-development-environments
```


Remove all containers from your system. (Note the _all_):

```
docker ps -a | cut -d' ' -f1 | tail -n +2
```