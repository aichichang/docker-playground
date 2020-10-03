# development
FROM node:alpine

WORKDIR '/app'

COPY package.json ./
RUN npm install
COPY . .

RUN npm run build


# production 
# the default port that nginx use is 80
FROM nginx
# this is for AWS to mapping our port to 80
# But usually in a development env, EXPOSE is just for engineers to read that the docker port is mapping to 80
EXPOSE 80

# what we need is the /app/build file to run our project in production
COPY --from=0 /app/build /usr/share/nginx/html

