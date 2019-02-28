FROM node:8

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install \
&& apt update \
&& apt install -y default-jre \
&& curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.6.1-amd64.deb \
&& dpkg -i filebeat-6.6.1-amd64.deb

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 80
CMD [ "node", "app/server.js" ]