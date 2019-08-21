# Intermediate to build
FROM node:11.9.0-alpine as build-image

WORKDIR /home/node/app
COPY package.json package-lock.json ./

RUN npm ci
COPY . .

RUN npm run build:docker

# Using nginx as a final image
FROM nginx:1.15-alpine

WORKDIR /usr/share/nginx/html
COPY --from=build-image /home/node/app/dist/my-app .
COPY build/product/inject-env.sh /root
RUN chmod 700 /root/inject-env.sh

EXPOSE 80

ENV API_URL=http://foo.bar
CMD ["/root/inject-env.sh"]