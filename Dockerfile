# Use the official Ruby image with version 3.1.2
FROM ruby:3.1.2

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    yarn \
    && rm -rf /var/lib/apt/lists/*

# Install Rails gem
RUN gem install rails -v "7.0.8"

# Copy Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Copy the .env file into the container
COPY .env.sample .env

# Install project dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose the port your Rails app will run on
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]


