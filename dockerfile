# Étape 1 : Construction de l'application avec Node.js
FROM node:lts-alpine as build-stage

RUN apk add --no-cache git

WORKDIR /app

# Cloner le dépôt depuis GitHub
RUN git clone https://github.com/trigo-William-HOANG/frontend-trigo.git .

# Déboguer pour vérifier la présence de nginx.conf
RUN ls -al /app

RUN npm install
RUN npm run build

# Étape 2 : Préparer l'image de production avec NGINX
FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
