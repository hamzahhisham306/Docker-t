#!/bin/bash
# فحص بسيط: هل الموقع يستجيب بـ 200؟
set -e

URL="https://yourdomain.com"
STATUS=$(curl -o /dev/null -s -w "%{http_code}" $URL)

if [ "$STATUS" -eq 200 ]; then
  echo "✅ الموقع يعمل ($STATUS)"
  exit 0
else
  echo "❌ الموقع لا يستجيب ($STATUS)"
  exit 1
fi