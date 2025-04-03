FROM node:20-alpine as builder

WORKDIR /app/medusa

RUN apk add python3 py3-pip pythonispython3

COPY package.json yarn.lock ./

RUN yarn install --production

COPY . .

RUN yarn build

CMD yarn start
