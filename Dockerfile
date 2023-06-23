# Use the official Node.js image as the base
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /src/app

# Copy package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --production

# Copy the entire project to the container
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the desired port (default is 3000)
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]