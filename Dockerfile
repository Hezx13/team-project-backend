# Start with the Node.js base image
FROM node:18.18.0

# Set the working directory
WORKDIR /app

# Copy Node.js dependencies files
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Install Python 3.10.11
RUN apt-get update && apt-get install -y python3.10 python3-pip

# Install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY . .

# Command to run your app
CMD ["ts-node", "index.js"]
