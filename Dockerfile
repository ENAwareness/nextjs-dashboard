# Use the official Node.js 20 image.
FROM node:20-alpine AS base

# Set working directory
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy dependency-related files
COPY package.json pnpm-lock.yaml ./

# Get all dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application files
COPY . .

# Build the Next.js application
RUN pnpm build

# Expose the port the app runs on
EXPOSE 3000

# Set the command to start the app
CMD ["pnpm", "start"]
