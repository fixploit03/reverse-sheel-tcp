## Reverse Shell TCP

Program [Bash](https://id.m.wikipedia.org/wiki/Bash_(syel_Unix)) sederhana yang dirancang untuk melakukan [reverse shell](https://github.com/fixploit03/reverse-shell-tcp/tree/main#apa-itu-reverse-shell-tcp) melalui koneksi [TCP](https://www.exabytes.co.id/blog/transmission-control-protocol/) menggunakan [netcat](https://nmap.org/ncat/).

## Apa itu Reverse Shell TCP

**Reverse Shell adalah teknik di mana target (korban) membuka koneksi ke attacker (penyerang) dan memberikan akses ke shell atau terminal komputer target melalui koneksi tersebut.** Pada teknik ini, koneksi dilakukan menggunakan protokol TCP.

## Instalasi 

> Pastikan Anda sudah berada dalam mode superuser (root) sebelum memulai proses instalasi.

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

Jalankan script `reverse-shell-tcp.sh` di mesin penyerang (attacker) untuk menghasilkan dua file: `run.sh` (untuk mendengarkan koneksi) dan `malicious.sh` untuk target (korban).

```
./reverse-shell-tcp.sh
```

Jalankan `run.sh` di mesin penyerang (attacker), 

```
./run.sh
```

kemudian kirim dan jalankan `malicious.sh` di mesin target (korban).

```
chmod +x malicious.sh
./malicious.sh
```

Koneksi reverse shell akan terbuka, memberi akses ke mesin target (korban).

**Selamat mencoba!**
