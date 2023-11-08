# Item Insight Mobile App
**Shanti Yoga Rahayu**<br>
**2206830542**<br>
**PBP C**<br>

# **Tugas 7: Elemen Dasar Flutter**

## **Perbedaan Utama antara *Stateless* dan *Stateful Widget* dalam Konteks Pengembangan Aplikasi Flutter?**

### *Stateless Widget*
*Stateless Widget* dalam Flutter adalah suatu jenis widget yang tidak mempunyai *state* sehingga kondisinya tidak berubah atau tidak memiliki kemampuan untuk melakukan perubahan data setelah dibuat. Widget ini digunakan untuk membuat bagian antarmuka yang bersifat statis, artinya tampilan atau elemen tersebut tidak akan berubah-ubah jika dilakukan berbagai macam interaksi, seperti menampilkan informasi statis dan tampilan atau elemen yang tidak memerlukan pembaruan. 

### *Stateful Widget*
*Stateful Widget* dalam Flutter adalah suatu widget yang mempunyai *state* sehingga dapat berubah-ubah. Widget ini umumnya digunakan ketika perlu mengelola state internal dan merespons interaksi pengguna dengan pembaruan yang terjadi dalam aplikasi. Widget ini cocok digunakan untuk membuat bagian antarmuka yang perlu berubah ketika dikenakan interaksi kepadanya, seperti button yang berubah warna ketika diklik ataupun respons lainnya. Widget ini bersifat dinamis dan dapat berubah sehingga Flutter akan membuat widget tersebut seiring dengan terjadinya perubahan untuk mencerminkan pembaruan yang terjadi. Pengelolaan *Stateful Widget* berbeda dengan *Stateless Widget*, di mana pada *Stateful Widget* memerlukan adanya sebuah kelas tambahan yang disebut State yang berperan dalam mengelola state dari widget tersebut.

## **Seluruh Widget yang Digunakan untuk Menyelesaikan Tugas Ini dan Penjelasan Fungsi Masing-Masing Widget**
* `AppBar`:
    Widget yang umumnya ditempatkan di bagian atas atau terkadang di bagian bawah aplikasi, berisi toolbar dan beberapa tombol tindakan umum lainnya.
* `ColorScheme`:
    Widget yang berisi kumpulan warna yang terdiri atas satu set 30 warna berdasarkan spesifikasi Material yang dapat digunakan untuk mengatur properti warna sebagian besar komponen.
* `Column`:
    Widget yang digunakan untuk membuat tata letak secara vertikal.
* `GridView.count`:
    Widget yang digunakan untuk membuat tata letak dengan jumlah tile yang tetap pada sumbu lintang.
* `InkWell`:
    Widget yang menghasilkan area persegi panjang widget Material yang merespons peristiwa sentuhan dengan menampilkan percikan yang terpotong.
* `Container`:
    Kelas widget yang memungkinkan penyesuaian widget turunannya.
* `Icon`:
    Widget yang digunakan untuk menampilkan berbagai ikon dengan berbagai model dan ukuran.
* `MaterialApp`: 
    Widget yang digunakan untuk mengelompookkan sejumlah widget yang umumnya diperlukan untuk Material Design applications.
* `ThemeData`:
    Widget yang digunakan untuk mengontrol tampilan tema seluruh aplikasi yang dibuat.
* `Padding`:
    Widget untuk menambahkan lapisan atau ruang kosong di sekitar widget atau kelompok widget.
* `Material`:
    Widget yang berfungsi untuk menyediakan desain visual Material Design pada widget lain.
* `Scaffold`:
    Widget berupa kelas dalam flutter yang menyediakan banyak widget atau bisa dikatakan API seperti Drawer, Snack-Bar, Bottom-Navigation-Bar, Floating-Action-Button, App-Bar, dll. Scaffold akan mengisi atau menempati seluruh layar perangkat dan mengisi ruang yang ada.
* `SnackBar`:
    Widget yang berupa pesan singkat dengan opsi tindakan yang muncul secara singkat di bagian bawah layar.
* `Text`:
    Text widget yang digunakan untuk menampilkan serangkaian teks dengan single-style. Teks dapat berupa satu atau beberapa baris, tergantung pada tata letak dengan argumen gaya teks yang bersifat opsional.

## **Implementasi Checklist Tugas 7**

1. Buka sebuah direktori yang akan digunakan untuk membuat aplikasi ini, kemudian buka terminal atau *command prompt* pada direktori tersebut.
2. Buat proyek Flutter baru dengan nama `item_insight_mobile` kemudian masuk ke dalam direktori proyek tersebut dengan menggunakan command berikut.
   ```
   flutter create item_insight_mobile
   cd item_insight_mobile
   ```
3. Buat file baru dengan nama `menu.dart` pada folder `lib` pada direktori proyek, kemudian tambahkan baris kode import berikut.
   ```dart
   import 'package:flutter/material.dart';
   ```
4. Buka file `main.dart`, kemudian pindahkan kode pada  pada bagian *class* `MyHomePage` dan `_MyHomePage` yang ada pada file  `main.dart` ke file `menu.dart`.
    ```
    class MyHomePage ... {
        ...
    }

    class _MyHomePageState ... {
        ...
    }
    ```
5. Tambahkan baris kode import berikut ini ke dalam file `main.dart` sehingga class `MyHomePage` dapat digunakan pada file `main.dart`.
   ```dart
   import 'package:item_insight_mobile/menu.dart';
   ```
6. Ubah sifat widget `MyHomePage` menjadi *stateless* dengan cara mengubah kode pada class `MyHomePage` menjadi seperti berikut ini.
   ```dart
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            )
        }
    }
   ```
7. Ubah baris kode `MyHomePage(title: 'Flutter Demo Home Page')` pada file `main.dart` menjadi `MyHomePage()`.
8. Buat class `Item`.
   ```dart
   class Item {
    final String name;
    final IconData icon;

    Item(this.name, this.icon);
   }
   ```
9. Tambahkan potongan kode berikut yang digunakan untuk menambahkan item-item yang akan dibuat di bawah *constructor* pada class `MyHomePage`.
    ```dart
    final List<Item> items = [
      Item("Lihat Produk", Icons.checklist),
      Item("Tambah Produk", Icons.add_shopping_cart),
      Item("Logout", Icons.logout),
    ];
    ```
10. Tambahkan kode berikut di dalam `Widget build` pada class `MyHomePage`.
    ```dart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Item Insight App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Main Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((Item item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    ```
11. Buat *stateless widget* baru dengan nama `ItemCard` yang digunakan untuk menampilkan card.
    ```dart
    class ItemCard extends StatelessWidget {
        final Item item;

        const ItemCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
                color: Colors.pinkAccent,
                child: InkWell(
                    // Area responsive terhadap sentuhan
                    onTap: () {
                        // Memunculkan SnackBar ketika diklik
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("Kamu telah menekan tombol ${item.name}!")));
                    },
                    child: Container(
                        // Container untuk menyimpan Icon dan Text
                        padding: const EdgeInsets.all(8),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Icon(
                                        item.icon,
                                        color: Colors.black, //Mengatur warna icon menjadi hitam
                                        size: 30.0,
                                    ),
                                    const Padding(padding: EdgeInsets.all(3)),
                                    Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.black), //Mengatur warna teks menjadi hitam
                                    ),
                                ],
                            ),
                        ),
                    ),
                ),
            );
        }
    }
    ```
12. Hapus class `_MyHomePage` yang sudah tidak lagi dibutuhkan. Hal ini dikarenakan widget `MyHomePage` sudah berubah menjadi *stateless*.

## **Bonus**

Implementasikan warna-warna berbeda untuk setiap tombol `Lihat Item`, `Tambah Item`, dan `Logout` <br/>

1. Pada class `Item`, tambahkan atribut baru untuk yang akan digunakan untuk penggunaan warna tiap Item.
   ```dart
    class Item {
        final String name;
        final IconData icon;
        final Color color;
        Item(this.name, this.icon, this.color);
    }
   ```
2. Pada setiap item yang terdapat di variabel `items`, tambahkan argumen warna yang sesuai keinginan.
   ```dart
    final List<Item> items = [
        Item("Lihat Item", Icons.checklist, Colors.yellow.shade200),
        Item("Tambah Item", Icons.add_shopping_cart, Colors.purple.shade200),
        Item("Logout", Icons.logout, Colors.red.shade200),
    ];
   ```
3. Mengubah baris kode pada `Widget build` di class `ItemCard` pada bagian `color: Colors.pinkAccent,` menjadi `color: item.color,`.
   ```dart
    class ItemCard extends StatelessWidget {
        ...
        @override
        Widget build(BuildContext context) {
            return Material(
                color: item.color,
                ...
            )
        }

    }
   ```
4. Di dalam direktori proyek, kemudian jalankan proyek tersebut di aplikasi Google Chrome dengan perintah `flutter run -d chrome` untuk memastikan aplikasi telah sesuai.