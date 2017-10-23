# Disposable Development Environments
## All Day DevOps - 2017

# Accompanying Resources

Stuff aobut he blog post at VictoryCTO

# Get Started

```bash
# Creates a workspace separate from your normal development area and allows 
# easier explanation of paths in blogs and instructions. 
mkdir ~/victory-cto && cd ~/victory-cto

# Get the source code including the runtime configuration
git clone

# Run the application 
docker run -p 5000:5000 -v $HOME/victory-cto/disposabel-development-environments:/code boyd/disposable-development-environments
```

# Handy Commands

Remove all containers from your system. (Note the _all_):

```
docker ps -a | cut -d' ' -f1 | tail -n +2
```