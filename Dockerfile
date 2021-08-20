FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Second runner phase
FROM nginx
WORKDIR '/app'
EXPOSE 80
COPY --from=builder  /app/build /usr/share/nginx/html

