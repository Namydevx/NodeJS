# 🔧 One-Click Fix Node.js Error di Ubuntu

Script ini dirancang untuk:
- Menghapus Node.js versi lama (misalnya v12.x) yang sering menyebabkan error syntax modern (`?.`, `?.[1]`, dll)
- Menghapus konflik paket seperti `libnode72`, `libnode-dev`
- Menginstal Node.js versi terbaru (18.x LTS) beserta `npm`

---

## 🚀 One-Click Install (Salin & Tempel)

Cukup jalankan perintah ini di VPS/Ubuntu:

```bash
bash <(curl -sSL https://raw.githubusercontent.com/Namydevx/NodeJS/main/fix-node-final.sh)
