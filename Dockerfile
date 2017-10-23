# THis is a bad idea, but hey it's the world I am currently living in!
FROM ubuntu:12.04

# This line looks complicated because it does some optimization stuff around
# container size. (All the stuff in a single run command means one layer, 
# deleting with `find` makes that layer smaller.)
RUN apt-get update -yq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    	build-essential \
        python-dev \
        python-pip \
        redis-server \
  && find /var/cache/apt/archives /var/lib/apt/lists -not -name lock -type f -delete

# This line might seem extraneous since we are going to mount the code from
# the wordstation. However this is also the production config, 
ADD . /code
WORKDIR /code 

# Install our python dependencies
RUN pip install -r requirements.txt

# The command to invoke by default when the container runs.
CMD python app.py
