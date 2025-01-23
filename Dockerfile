FROM ruby:3.3-alpine

# Install required packages for building native extensions
RUN apk add --no-cache build-base git bash

# Set the working directory
WORKDIR /app

# Copy gem to /app directory
COPY . /app

# Install dependencies
RUN bundle install

# Default command
CMD ["irb"]
