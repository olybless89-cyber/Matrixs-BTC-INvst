# Matrixs BTC — Railway-ready Node container
FROM node:20-alpine

WORKDIR /app

# Install dependencies first (better layer caching)
COPY package*.json ./
RUN npm install --omit=dev

# Copy the rest of the app
COPY server ./server
COPY public ./public

# Runtime config
ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000

RUN mkdir -p /app/data

CMD ["npm", "start"]