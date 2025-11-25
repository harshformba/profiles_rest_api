# Use the specified Ubuntu 18.04 (Bionic) base image
FROM ubuntu:bionic-20240523

# Set the working directory inside the container
WORKDIR /app



# Update package lists and install the required software
RUN apt-get update && \
    apt-get install -y python3-venv zip && \
    rm -rf /var/lib/apt/lists/*

# Set up the 'python' alias to 'python3' for subsequent commands in this Dockerfile
# and for interactive use if using an interactive shell.
SHELL ["/bin/bash", "-c"]
RUN echo "alias python='python3'" >> ~/.bash_aliases

# This exposes port 8000, similar to the forwarded_port in Vagrant.
# It doesn't actually publish the port, but acts as documentation.
EXPOSE 8000

# Define a default command to run when the container starts.
# You might want to change this to run your actual application.
CMD ["/bin/bash"]
