# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the working directory in the container
WORKDIR /usr/src/avr

# Install dependencies required for the build script and git to clone the repository
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    wget \
    subversion \
    autoconf \
    automake \
    texinfo \
    make \
    && rm -rf /var/lib/apt/lists/*
    
# Clone the AVR toolchain setup script from the GitHub repository
RUN git clone https://github.com/MarkR42/avr_toolchain.git .

# Make the build script executable
RUN chmod +x build.sh

# Execute the build script
# This step will install the AVR toolchain according to the script's instructions
RUN ./build.sh

ENV PATH=/usr/local/avr/bin:$PATH

# The following line is optional. It sets the default command for the container.
# It can be useful for debugging or if you want to run a specific tool upon container startup.
# For example, to open a bash shell when the container runs:
CMD ["/bin/bash"]
