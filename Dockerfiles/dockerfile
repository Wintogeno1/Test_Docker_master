FROM ruby:2.7.1

# Update and install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set working directory
WORKDIR /myapp

# Copy Gemfile and Gemfile.lock for bundle install
COPY Gemfile ./
COPY Gemfile.lock ./

# Install gems
RUN bundle install

# Copy application files
COPY . .

# Expose port
EXPOSE 3000

# Copy the startup script into the container
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Make the script executable
RUN chmod +x /docker-entrypoint.sh

# Define the docker-entrypoint script as the entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]


CMD ["rails","server" , "-b" ,"0.0.0.0"]