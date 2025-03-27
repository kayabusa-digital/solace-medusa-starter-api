FROM node:18-alpine

WORKDIR /app/medusa

COPY . .

RUN apk add --no-cache python3 py3-pip

RUN npm install

RUN npm run build

CMD yarn db:migrate && npm run start
