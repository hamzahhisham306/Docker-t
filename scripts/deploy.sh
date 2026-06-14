#!/bin/bash
# يتوقف فورًا عند أي خطأ — مهم جدًا في النشر
set -euo pipefail

echo "🚀 بدء النشر..."

# أوامر دمج ملفي compose
COMPOSE="docker compose -f docker-compose.yml -f docker-compose.prod.yml"

# سحب آخر صورة من الـ Registry
echo "📥 سحب آخر صورة..."
$COMPOSE pull

# إعادة التشغيل بالصورة الجديدة (دون توقف يُذكر)
echo "🔄 إعادة تشغيل الخدمات..."
$COMPOSE up -d

# تنظيف الصور القديمة لتوفير المساحة
echo "🧹 تنظيف..."
docker image prune -f

echo "✅ اكتمل النشر بنجاح"