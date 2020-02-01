FROM node:10
RUN npm install -g nodemon

COPY package*.json /tmp/
RUN cd /tmp/ && npm install
RUN mkdir -p /app/backend && cp -a /tmp/node_modules /app/backend/

WORKDIR /app/backend
COPY dist/apps/backend/ /app/backend

EXPOSE 3333
CMD [ "nodemon", "main.js" ]
