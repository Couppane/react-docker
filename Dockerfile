# https://docs.docker.com/develop/develop-images/multistage-build/

# Use the official image as a parent image
# base image node 11.10.0 on linux alpine
# build environment
# builder: name the builder stage
FROM node:11.10.0-alpine as builder 

# RUN mkdir /app

# Set the working directory within the virtualized Docker environment
WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

# Copies package.json and package-lock.json to Docker environment
COPY package.json package-lock.json ./

# used in automated environments such as test platforms, continuous integration, and deployment
RUN npm ci --silent

RUN npm install react-scripts@3.4.1 -g --silent

# Copy the rest of your app's source code from your host to Docker environment.
COPY . ./

# Build app
RUN npm run build

# Production environment
FROM nginx:stable-alpine

# Copy from build environment
COPY --from=builder /app/build /usr/share/nginx/html

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 80

# Run the specified command within the container.
CMD ["nginx", "-g", "daemon off;"]
