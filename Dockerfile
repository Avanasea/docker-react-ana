FROM node:16-alpine as builder 
# Above command tags the portion of the code as the builder phase
WORKDIR '/app'
COPY package.json . 
RUN npm install 
COPY . .
RUN npm run build 

# The folder which we want to copy in the run phase /app/build


FROM nginx 
# I want to copy something from that builder phase
COPY --from=builder /app/build /usr/share/nginx/html   

# Nginx uses the default port 80