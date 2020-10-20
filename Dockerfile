FROM node:alpine

WORKDIR '/app'

COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build


FROM nginx
EXPOSE 80 # will only work with elastic beanstalk
COPY --from=0 /app/build /usr/share/nginx/html