# ===== المرحلة 1: البناء =====
FROM node:24-alpine AS build
WORKDIR /app

# نسخ ملفات المكتبات أولًا للاستفادة من الـ Cache
COPY package*.json ./
RUN npm ci

# نسخ الكود والبناء
COPY . .
RUN npm run build

# ===== المرحلة 2: الإنتاج (Nginx خفيف) =====
FROM nginx:alpine AS production

# نسخ ملفات البناء فقط + إعداد Nginx
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# فحص صحة مدمج في الصورة
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
