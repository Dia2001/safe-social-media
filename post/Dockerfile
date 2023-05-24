FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV PORT=3080
ENV TOKEN_KEY=socialMedia
ENV MONGO_URI=mongodb://host.docker.internal:27017/Posts

EXPOSE 3080

CMD [ "npm", "start" ]
