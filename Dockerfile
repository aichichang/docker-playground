# development
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build


# production 
# the default port that nginx use is 80
FROM nginx

# what we need is the /app/build file to run our project in production
COPY --from=builder /app/build /usr/share/nginx/html
