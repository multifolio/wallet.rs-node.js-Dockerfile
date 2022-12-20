FROM node:18
# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install libudev-dev and more
RUN apt-get update && apt-get install -y libudev-dev libusb-1.0-0-dev libclang-dev clang

# Create app directory
WORKDIR /usr/src/app

# Copy files from host(your machine) to container
COPY . .

# Install app dependencies
RUN npm install

# Command that is executed when the container is created('docker run') from the image
CMD [ "npm", "start" ]
