# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy the package.json and pnpm-lock.yaml to the container
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application code to the container
COPY . .

# Build the application
RUN pnpm build

# Expose the port that the app runs on
EXPOSE 3000

# Start the application
CMD ["pnpm", "start"]
