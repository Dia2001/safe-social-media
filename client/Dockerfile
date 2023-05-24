FROM node:14-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

COPY .env.Development .env

RUN npm run build

CMD ["npm", "start"]