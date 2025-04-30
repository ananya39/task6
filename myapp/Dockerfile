#Use Node.js as base image
FROM node:20-alpine

# Step 2: Set working directory inside the container
WORKDIR /app

# Step 3: Copy package files and install dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# Step 4: Copy the rest of the application
COPY . .

# Step 5: Build admin panel
RUN npm run build

# Step 6: Expose the port
EXPOSE 1337

# Step 7: Run the app
CMD ["npm", "run", "start"]

