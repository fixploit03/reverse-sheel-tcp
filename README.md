## Reverse Shell TCP

Program Bash sederhana yang dibuat untuk melakukan reverse shell melalui koneksi TCP menggunakan netcat.

## Instalasi 

```
apt-get update
apt-get install netcat
apt-get install bindutils
apt-get install git
git clone https://github.com/fixploit03/reverse-shell-tcp/
cd reverse-shell-tcp
chmod +x reverse-shell-tcp.sh
```

## Cara menggunakan

Jalankan script `reverse-shell-tcp.sh` di mesin penyerang untuk menghasilkan dua file: `run.sh` (untuk mendengarkan koneksi) dan `malicious.sh` (untuk korban).

```
./reverse-shell-tcp.sh
```

Jalankan `run.sh` di mesin penyerang, 

```
./run.sh
```

kemudian kirim dan jalankan `malicious.sh` di mesin korban.

```
chmod +x malicious.sh
./malicious.sh
```

Koneksi reverse shell akan terbuka, memberi akses ke mesin korban.

**Selamat mencoba!**
