#Step:1 Build React app
FROM node:alpine3.18 as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Step 2: Create a Node.js Server
FROM node:alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --production
COPY --from=build /app/build ./build
COPY server.js .

# Expose Port & Start Server
EXPOSE 5000
CMD ["node", "server.js"]

# #Step2: Server with Nginx
# FROM nginx:1.23-alpine
# WORKDIR /usr/share/nginx/html
# RUN rm -rf *
# COPY --from=build /app/build .
# EXPOSE 80  
# ENTRYPOINT [ "nginx", "-g", "daemon off;" ]