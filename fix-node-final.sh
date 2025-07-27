#!/bin/bash

echo "🧹 Menghapus versi Node.js lama dan konflik..."
apt remove --purge -y nodejs libnode72 libnode-dev 2>/dev/null
rm -rf /usr/lib/node_modules/
rm -rf /usr/include/node
rm -rf /usr/share/systemtap/tapset/node.stp
rm -rf /usr/local/bin/node /usr/local/bin/npm

echo "🧼 Membersihkan cache APT..."
apt clean
rm -rf /var/cache/apt/archives/*

echo "🌐 Menambahkan repo NodeSource untuk Node.js 18..."
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

echo "⬇️ Menginstal Node.js 18..."
apt install -y nodejs

echo "✅ Versi Node.js dan NPM:"
node -v
npm -v

echo "⬇️ Menginstal pm2 (process manager)..."
npm install -g pm2

echo "✅ Versi PM2:"
pm2 -v

echo "📦 Menginstal module tambahan yang dibutuhkan..."
npm install qrcode-terminal whatsapp-web.js node-ssh tesseract.js node-cron

echo "🚀 Melanjutkan ke instalasi Puppeteer dependencies..."

apt install -y wget curl gnupg2 ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
  libatk1.0-0 libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 libnspr4 libnss3 libxcomposite1 libxdamage1 libxrandr2 xdg-utils lsb-release

echo "🔧 Menambahkan repo Google Chrome..."
wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

echo "⬇️ Menginstal Google Chrome..."
apt update && apt install -y google-chrome-stable

echo "✅ Google Chrome versi:"
google-chrome --version

echo ""
echo "📌 Tambahkan konfigurasi Puppeteer berikut ke kode JS-mu:"
echo ""
echo "  const browser = await puppeteer.launch({"
echo "    headless: true,"
echo "    executablePath: '/usr/bin/google-chrome',"
echo "    args: ['--no-sandbox', '--disable-setuid-sandbox']"
echo "  });"
echo ""
echo "📦 Gunakan PM2 untuk menjalankan aplikasi tanpa putus:"
echo ""
echo "  pm2 start scriptmu.js"
echo "  pm2 save"
echo "  pm2 startup"
echo ""
echo "🎉 Semua selesai! Node.js 18, Puppeteer, Chrome, PM2, dan semua module sudah terinstal!"
