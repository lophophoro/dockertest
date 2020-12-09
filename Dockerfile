#fase 0
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
#fase 1
#--from=0 quiere decir, "desde fase 0"
#la imagen nginx usa el comando por defecto "start nginx", por lo que no hace falta especificarlo aqui usando "RUN"
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

#nginx corre en el puerto 80
#para ejecutar la imagen, usar: docker run -p 8080:80 <id>