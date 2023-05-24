FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV NODE_SERVER_POST=9999
ENV NODE_SERVER_HOST=localhost
ENV AUTH_SERVICE_URL=http://auth:5010
ENV POST_SERVICE_URL=http://post:3080


EXPOSE 9999

CMD [ "npm", "start" ]
