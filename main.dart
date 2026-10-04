// =============================================
// HW 2 - Bank Sampah
// Nama : Agit Elhandinnata
// NIM  : 1124160178
// =============================================

// ---abstraction----
int hargaBotolPlastik = 1800;
int hargaKardus = 2000;
int hargaLogam = 5000;

final int minimalTarik = 10000;

// ---decomposition---
// ---function dibawah mengarah ke br-01 yaitu tiap kategori berbeda harga---
int tentukanHarga(String kategori) {
  if (kategori == "botol plastik") {
    return hargaBotolPlastik;
  } else if (kategori == "kardus") {
    return hargaKardus;
  } else if (kategori == "logam") {
    return hargaLogam;
  } else {
    return 0;
  }
}

// --function dibawah adalah function untuk menambah saldo atau jika ada pengguna yang setor sampah dan disini saya menambahkan notifikasi seperti setor sampah berhasil, jenis sampah dll---
double tambahSaldo(double saldo,String kategori,double berat) {
  int harga = tentukanHarga(kategori);
  double nilaiSampah = harga * berat;
  print("Setor Sampah berhasil!!");
  print("Jenis sampah yang disetor : $kategori");
  print("Berat : ${berat} kg");
  print("Harga perKg: Rp.${harga}");
  print("Nilai Sampah : Rp.${nilaiSampah.toInt()}");

  return saldo + nilaiSampah;
}

// ---function dibawah mengarah keapada br-02 dan br-03 yaitu minimal penarikan 10 ribu rupiah dan saldo tidak boleh minus---
double tarikSaldo(double saldo, double jumlah) {
  if (jumlah < minimalTarik) {
    print("Maaf, minimal penarikan adalah Rp10.000.");
    return saldo;
  }
  if (jumlah > saldo) {
    print("Maaf, saldo anda tidak mencukupi.");
    return saldo;
  }
  print("Anda melakukan penarikan sebesar Rp${jumlah.toInt()}.");
  print("Sisa saldo anda: Rp${(saldo - jumlah).toInt()}.");

  return saldo - jumlah;
}

// ---dan yang terakhir adalah function untuk menampilkan saldo, jika sudah seleesai transaksi---
void tampilkanSaldo(double saldo) {
  print("Saldo anda: Rp${saldo.toInt()}");
}

void main() {
// Skenario 1 - SO1 (Sukses) - expected: berhasil melakukan penarikan saldo sebesar 10000
  print("======================================");
  print("|             TARIK SALDO            |");
  print("======================================");
//   ---skenario pertama, yaitu melakukan penarikan sebesar 10 ribu rupiah dengan saldo awal 15000--
  tarikSaldo(15000, 10000);
  
//  Skenario 2 - SO2 (gagal:br-02)  -expected: gagal tarik saldo karena penarikan minimal 10 ribu rupiah
  print("======================================");
  print("|          TARIK SALDO GAGAL         |");
  print("======================================");
//   ---skenaio kedua, yaitu melakukan penarikan sebesar 5 ribu rupiah namun gagal karena penarikan minimal 10 ribu rupiah---
  tarikSaldo(15000, 5000);
  
//   Skenario 3 - SO 3(gagal:br-03) -expected: gagal tarik saldo karean saldo tidak boleh minus atau menarik dengan jumlah yang lebh besar dari saldo 
  print("======================================");
  print("|          TARIK SALDO GAGAL         |");
  print("======================================");
//   ---skenario ketiga, gagal tarik karena saldo tidak boleh minus---
  tarikSaldo(15000, 20000);
  
//   Skenario 4 - SO4 (Sukses) -expected: berhasil menambah saldo atau setor sampah
  print("======================================");
  print("|           SETOR SAMPAH             |");
  print("======================================");
//   ---skenario keempat, berhasil menambah saldo yang dimana saldo awal adalah 0 lalu pengguna menyetor botol plastik sebanyak 5kg---
  double saldo = tambahSaldo(0,"botol plastik",5);
  tampilkanSaldo(saldo);

//   Skenario 5 - SO5 (Sukses) -expected: berhasil menambah saldo atau setor sampah
  print("======================================");
  print("|           SETOR SAMPAH             |");
  print("======================================");
  //   ---skenario kelima, berhasil menambah saldo yang dimana saldo awal adalah 0 lalu pengguna menyetor logam sebanyak 2kg---
  double saldo2 = tambahSaldo(0,"logam",2);
  tampilkanSaldo(saldo2);
  
}
