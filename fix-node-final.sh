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

echo "✅ Cek versi Node.js dan NPM..."
node -v
npm -v

echo "🎉 Selesai! Node.js berhasil diperbarui ke versi terbaru!"
