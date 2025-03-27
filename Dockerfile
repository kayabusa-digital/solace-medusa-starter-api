FROM node:18-alpine

WORKDIR /app/medusa

ENV NODE_OPTIONS="--max-old-space-size=8192"

COPY . .

RUN apk add --no-cache python3 py3-pip

RUN npm install

RUN npm run build

CMD yarn db:migrate && npm run start
