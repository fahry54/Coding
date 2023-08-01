class Karyawan:
    def __init__(self, nama, usia, pendapatan, insentif_lembur):
        self.nama = nama
        self.usia = usia
        self.pendapatan = pendapatan
        self.pendapatan_tambahan = 0
        self.insentif_lembur = insentif_lembur

    def lembur(self):
        self.pendapatan_tambahan += self.insentif_lembur

    def tambahan_proyek(self, jumlah_tambahan):
        self.pendapatan_tambahan += jumlah_tambahan

    def total_pendapatan(self):
        return self.pendapatan + self.pendapatan_tambahan


class TenagaLepas(Karyawan):
    def __init__(self, nama, usia, pendapatan):
        super().__init__(nama, usia, pendapatan, 0)

    def tambahan_proyek(self, nilai_proyek):
        self.pendapatan_tambahan += int(nilai_proyek * 0.01)


class AnalisData(Karyawan):
    def __init__(self, nama, usia=21, pendapatan=6500000, insentif_lembur=100000):
        super().__init__(nama, usia, pendapatan, insentif_lembur)


class IlmuanData(Karyawan):
    def __init__(self, nama, usia=25, pendapatan=12000000, insentif_lembur=150000):
        super().__init__(nama, usia, pendapatan, insentif_lembur)

    def tambahan_proyek(self, nilai_proyek):
        self.pendapatan_tambahan += 0.1 * nilai_proyek


class PembersihData(TenagaLepas):
    def __init__(self, nama, usia, pendapatan=400000):
        super().__init__(nama, usia, pendapatan)


class DokumenterTeknis(TenagaLepas):
    def __init__(self, nama, usia, pendapatan=2500000):
        super().__init__(nama, usia, pendapatan)


class Perusahaan:
    def __init__(self, nama, alamat, nomor_telepon):
        self.nama = nama
        self.alamat = alamat
        self.nomor_telepon = nomor_telepon
        self.list_karyawan = []

    def aktifkan_karyawan(self, karyawan):
        if isinstance(karyawan, Karyawan):
            self.list_karyawan.append(karyawan)

    def nonaktifkan_karyawan(self, nama_karyawan):
        karyawan_nonaktif = None
        for karyawan in self.list_karyawan:
            if karyawan.nama == nama_karyawan:
                karyawan_nonaktif = karyawan
                break
        if karyawan_nonaktif is not None:
            self.list_karyawan.remove(karyawan_nonaktif)

    def total_pengeluaran(self):
        pengeluaran = 0
        for karyawan in self.list_karyawan:
            pengeluaran += karyawan.total_pendapatan()
        return pengeluaran

    def cari_karyawan(self, nama_karyawan):
        for karyawan in self.list_karyawan:
            if karyawan.nama == nama_karyawan:
                return karyawan
        return None


ani = PembersihData('Ani', 25)
budi = DokumenterTeknis('Budi', 18)
cici = IlmuanData('Cici')
didi = IlmuanData('Didi', 32, pendapatan=20000000)
efi = AnalisData('Efi')
febi = AnalisData('Febi', 28, pendapatan=12000000)

perusahaan = Perusahaan('ABC', 'Jl.Jendral Sudirman, Blok 11', '(021)95812XX')

perusahaan.aktifkan_karyawan(ani)
perusahaan.aktifkan_karyawan(budi)
perusahaan.aktifkan_karyawan(cici)
perusahaan.aktifkan_karyawan(didi)
perusahaan.aktifkan_karyawan(efi)
perusahaan.aktifkan_karyawan(febi)

print(perusahaan.total_pengeluaran())
