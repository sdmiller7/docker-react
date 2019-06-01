# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# /app/build is the folder we care about
# Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# starts nginx as default so we don't have to declare it