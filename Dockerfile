FROM node:latest as builder

WORKDIR /app/medusa

COPY . .

RUN apt-get update && apt-get install -y python3 python3-pip python-is-python3

RUN yarn

RUN yarn build

FROM node:latest as production

WORKDIR /app/medusa

COPY --from=builder /app/medusa/.medusa/server .
COPY --from=builder /app/medusa/node_modules ./node_modules

CMD yarn db:migrate && yarn start
