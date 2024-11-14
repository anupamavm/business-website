# Use the official Node.js image as base
FROM node:16-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app for production
RUN npm run build

# Expose port 3000 (or whichever port your app uses)
EXPOSE 3000

# Run the Next.js app
CMD ["npm", "start"]
