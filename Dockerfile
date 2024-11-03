FROM node:18 AS angular

WORKDIR /app
COPY . $WORKDIR

ARG API_URL

RUN npm install -g @angular/cli && npm install
RUN node set-env.js
RUN ng build

FROM nginx:alpine
COPY --from=angular /app/dist/angular-conduit /usr/share/nginx/html
EXPOSE 80
