class Karyawan:
    nama_perusahaan = 'ABC'
    tunjangan_transportasi = 500000
    def __init__(self, nama, usia, pendapatan):
        self.nama = nama
        self.usia = usia
        self.pendapatan = pendapatan

karyawan_1 = Karyawan('Budi', 35, 5000000)
karyawan_2 = Karyawan('Didi', 30, 5000000)
karyawan_1.__class__.nama_perusahaan = 1000000

total_pengeluaran = karyawan_1.__class__.tunjangan_transportasi
total_pengeluaran += karyawan_2. __class__.tunjangan_transportasi
total_pengeluaran += karyawan_1.pendapatan
total_pengeluaran += karyawan_2.pendapatan
print(total_pengeluaran)
