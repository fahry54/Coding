class Karyawan:
    nama_perusahaan = 'ABC'
    insentif_lembur = 250000

    def __init__(self, nama, usia, pendapatan):
        self.__nama = nama
        self.__usia = usia
        self.__pendapatan = pendapatan
        self.__pendapatan_tambahan = 0

    def lembur(self):
        if self.__usia > 30:
            self.__pendapatan_tambahan += self.insentif_lembur * 2
        else:
            self.__pendapatan_tambahan += self.insentif_lembur

    def tambahan_proyek(self, insentif_proyek):
        self.__pendapatan_tambahan += insentif_proyek

    def total_pendapatan(self):
        return self.__pendapatan + self.__pendapatan_tambahan

karyawan_1 = Karyawan('Kiki', 35, 8000000)
karyawan_1.lembur()
karyawan_1.tambahan_proyek(karyawan_1.total_pendapatan())
print(karyawan_1.total_pendapatan())
