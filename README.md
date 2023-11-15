# Item Insight Mobile App
**Shanti Yoga Rahayu**<br>
**2206830542**<br>
**PBP C**<br>

# **Tugas 7: Elemen Dasar Flutter**

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


# **Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements**

## **Membuat Minimal Satu Halaman Baru pada Aplikasi, yaitu Halaman Formulir Tambah Item Baru dengan Ketentuan sebagai Berikut:**
1. Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
2. Memiliki sebuah tombol Save.
3. Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut: <br/>
a. Setiap elemen input tidak boleh kosong. <br/>
b. Setiap elemen input harus berisi data dengan tipe data atribut modelnya. <br/>

Langkah Implementasi:
1. Buat file baru bernama `item_form.dart` pada folder lib, lalu tambahkan kode berikut. Dalam kode ini terdapat import yang dibutuhkan, terdapat `_formKey`, dan terdapat variabel untuk menyimpan input.
```
import 'package:flutter/material.dart';
import 'package:item_insight_mobile/widgets/left_drawer.dart';
import 'package:item_insight_mobile/widgets/menu_card.dart';

class ItemFormPage extends StatefulWidget {
    const ItemFormPage({super.key});

    @override
    State<ItemFormPage> createState() => _ItemFormPageState();
}

List<Item> items = [];

class _ItemFormPageState extends State<ItemFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    String _category = "";
    int _amount = 0;
    int _price = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        )
    }
}
```

2. Pada bagian `Scaffold`, tambahkan potongan kode berikut. Pada potongan kode ini, `_formKey` ditambahkan di atribut `key` di `Form` sebagai handler form state, validasi form, dan penyimpanan form. Pada potongan kode ini juga ditambhakan widget `Column` sebagai child `SingleChildScrollView`. Terdapat `TextFormField` yang dibungkus `Padding` sebagai child `Column` dan `crossAxisAlignment` yang digunakan untuk mengatur allignmentnya. Pada potongan kode ini, `onChanged` digunakan untuk menangkap perubahan dan `validator` untuk melakukan validasi `TextFormField`.

```
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Add Your Item',
            ),
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
        ),

        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value) {
                    setState(() {
                        _name = value!;
                    });
                    },
                    onSaved: (String? value) {
                    setState(() {
                        // Menambahkan variabel yang sesuai
                        _name = value!;
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Name cannot be empty!";
                    }
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Category",
                    labelText: "Category",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value) {
                    setState(() {
                        _category = value!;
                    });
                    },
                    onSaved: (String? value) {
                    setState(() {
                        // Menambahkan variabel yang sesuai
                        _category = value!;
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Category cannot be empty!";
                    }
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value) {
                    setState(() {
                        _amount = int.parse(value!);
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Amount cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                        return "Amount must be a valid integer!";
                    }
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value) {
                    setState(() {
                        _price = int.parse(value!);
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Price cannot be empty!";
                    }
                    if (int.tryParse(value) == null) {
                        return "Price must be a valid integer!";
                    }
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value) {
                    setState(() {
                        // Menambahkan variabel yang sesuai
                        _description = value!;
                    });
                    },
                    onSaved: (String? value) {
                    setState(() {
                        // Menambahkan variabel yang sesuai
                        _description = value!;
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Description cannot be empty!";
                    }
                    return null;
                    },
                ),
                ...
                ]),    
            ),
        ),
    );
}
 ```


3. Buat tombol di bagian Tombol untuk pop up sebagai child dari `Column`. Kemudian, bungkus dengan widget `Padding` dan `Allign` guna memunculkan data pada pop up ketika tombol ditekan. Lakukan dengan menambahkan potongan kode sebagai berikut. Dalam potongan kode ini, terdapat fungsi `showDialog()` pada bagian `onPressed()`, widget `AlertDialog`, dan fungsi untuk reset form.
```
            ...
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      items.add(Item(
                        name: _name,
                        category: _category,
                        amount: _amount,
                        price: _price,
                        description: _description,
                      ));
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
```

## **Mengarahkan Pengguna ke Halaman Form Tambah Item Baru Ketika Menekan Tombol `Tambah Item` Pada Halaman Utama**
1. Buka file `menu.dart`, lalu tambahkan kode berikut agar dapat menavigasi halaman lain.
```
    ...
    @override
    Widget build(BuildContext context) {
        return Material(
            color: item.color,
            child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                    // Memunculkan SnackBar ketika diklik
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            content: Text("Kamu telah menekan tombol ${item.name}!")));

                    // Navigate ke route yang sesuai (tergantung jenis tombol)
                    if (item.name == "Add Items") {
                        // Melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemFormPage(),
                            ),
                        );
                    }
                },
            ),
        );
    }
```

2. Buat file baru di direktori `widgets` dengan nama `menu_card.dart`. Lalu pindahkan bagian `class MenuItem` dan `class MenuCard` di `menu.dart` ke `menu_card.dart`. Impor juga `material.dart` bawaan dan `item_form.dart` di `menu_card.dart`, lalu impor `menu_card.dart` di `menu.dart`.

3. Buat folder baru dengan nama `screens` di direktori `lib`, lalu pindahkan `menu.dart` dan `item_form.dart` ke sana. Gunakan IDE yang ada ekstensi Flutter dan Dart agar refactoring dilakukan secara otomatis.

## **Memunculkan Data Sesuai Isi dari Formulir yang Diisi dalam Sebuah `Pop-Up` Setelah Menekan Tombol `Save` pada Halaman Formulir Tambah Item Baru**
1. Buka file item_form.dart, pada bagian `onPressed` dari `ElevatedButton`, tambahkan kode berikut sehingga dapat memunculkan data sesuai isi formulir dalam sebuah pop-up setelah menekan tombol "Save" pada halaman formulir tambah item baru. 
```
onPressed: () {
  if (_formKey.currentState!.validate()) {
    items.add(Item(
      name: _name,
      category: _category,
      amount: _amount,
      price: _price,
      description: _description,
    ));
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Item saved successfully'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Memunculkan value-value lainnya
                Text('Name: $_name'),
                Text('Category: $_category'),
                Text('Amount: $_amount'),
                Text('Price: IDR $_price'),
                Text('Description: $_description')
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    _formKey.currentState!.reset();
  }
},
```


## **Membuat Sebuah Drawer pada Aplikasi dengan Ketentuan sebagai Berikut:**

1. Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
2. Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
3. Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.

Langkah implementasi:
1. Di dalam direktori `widgets`, buat file baru bernama `left_drawer.dart`, lalu tambahkan kode berikut.

```dart
    import 'package:flutter/material.dart';
    import 'package:item_insight_mobile/screens/menu.dart';
    import 'package:item_insight_mobile/screens/item_form.dart';

    class LeftDrawer extends StatelessWidget {
        const LeftDrawer({super.key});

        @override
        Widget build(BuildContext context) {
            return Drawer(
                child: ListView(
                    children: [
                        const DrawerHeader(
                            // Bagian drawer header
                            ...
                        ),
                        // Bagian routing
                        ...
                    ],
                ),
            );
        }
    }
```

2. Isi bagian drawer headernya dengan kode berikut agar tampilan terlihat menarik.

```dart
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            child: Column(
              children: [
                Text(
                  'Item Insight App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Manage and create your items easily from here!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
```

3. Isi bagian routing menjadi seperti potongan kode berikut untuk halaman-halaman yang sudah diimpor sebelumnya.
```dart
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Items'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItemFormPage()));
            },
          ),
```
4. Buka `menu.dart`, lalu tambahkan kode berikut untuk menambahkan drawer yang sudah dibuat.
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Item Insight App',
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(), // Tambahkan bagian ini
    )
  }
```


## **Bonus**

### **Membuat Sebuah Halaman Baru, yaitu Halaman Daftar Item yang Sudah Dibuat dengan Isi Halamannya adalah Setiap Data Produk yang Sudah Pernah Dibuat**
1. Buka `menu_card.dart` lalu tambahkan list dan class item untuk menyimpan item yang ditambahkan seperti kode berikut.
```dart
class Item {
  final String name;
  final String category;
  final int amount;
  final int price;
  final String description;

  Item({
    required this.name,
    required this.category,
    required this.amount,
    required this.price,
    required this.description,
  });
}
```

2. Buka `item_form.dart` tambahkan potongan kode berikut.
    ```dart
    List<Item> items = [];
    ```


3. Pada file `item_form.dart` lalu tambahkan kode berikut di bagian Align `onPressed` untuk menyimpan item yang ditambahkan.

```dart
        ...
        onPressed: () {
            if (_formKey.currentState!.validate()) {
                items.add(Item(
                    name: _name,
                    category: _category,
                    amount: _amount,
                    price: _price,
                    description: _description,
                ));
                ...
            }
        } 
```

4.  Buat file baru di direktori `screens` dengan nama `item_list.dart` sebagai page untuk melihat list item, isi dengan kode berikut.
```dart
import 'package:flutter/material.dart';
import 'package:item_insight_mobile/widgets/left_drawer.dart';
import 'package:item_insight_mobile/screens/item_form.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Item'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              border: Border.all(
                color: Colors.pink.shade300,
                width: 2.0, // Adjust the width as needed
              ),
              borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
            ),
            child: ListTile(
              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category: ${item.category}"),
                  Text("Price: IDR ${item.price}"),
                  Text("Amount: ${item.amount}"),
                ],
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.pink),
                onPressed: () {
                  // Ketika click icon detail, akan memunculkan data lengkap item
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(item.name),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("Category: ${item.category}"),
                              Text("Amount: ${item.amount}"),
                              Text("Price: IDR ${item.price} "),
                              Text("Description: ${item.description}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

```

### **Mengarahkan Pengguna ke Halaman Tersebut Jika Menekan Tombol `Lihat Produk` pada Halaman Utama atau Drawer.**
1. Tambahkan impor dan potongan kode berikut pada bagian InkWell dalam file `menu_card.dart` untuk mengarahkan pengguna ke halaman lihat produk.
```dart
import 'package:item_insight_mobile/screens/item_form.dart';
import 'package:item_insight_mobile/screens/item_list.dart';
    ...
          if (item.name == "Show Items") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemsPage(),
                ));
          }
          
          if (item.name == "Add Items") {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ItemFormPage(),
              ),
            );
          }
```

2. Buatlah routing pada file `left_drawer.dart` dengan menambahkan kode berikut ini untuk mengarahkan pengguna ke halaman Lihat Produk.
```dart
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Show Items'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemsPage(),
                  ));
            },
          ),
```

## **Penjelasan Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, Disertai dengan Contoh Mengenai Penggunaan Kedua Metode Tersebut yang Tepat!**

### Navigator.push()
`Navigator.push()` digunakan untuk menambahkan layar/rute baru di atas layar/rute saat ini dalam tumpukan navigasi. Layar/rute sebelumnya akan tetap ada dalam tumpukan navigasi. `Navigator.push()`memungkinkan pengguna dapat kembali ke rute sebelumnya dengan tombol kembali perangkat.
Contoh penggunaan `Navigator.push()` yang tepat:
```dart
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NextPage()),
);
```
### Navigator.pushReplacement()
`Navigator.pushReplacement()` digunakan untuk menambahkan layar/rute baru ke tumpukan navigasi dan menggantikan layar/rute saat ini dengan layar/rute yang baru. Layar/rute sebelumnya akan dihapus dari tumpukan navigasi. `Navigator.pushReplacement()` berguna ketika ingin mengganti layar/rute saat ini dengan layar baru dan menghindari pengguna dapat kembali ke layar/rute sebelumnya.
Contoh penggunaan `Navigator.pushReplacement()` yang tepat:
```
Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => NewPage()),
  );
```

## **Penjelaskan Masing-Masing Layout Widget pada Flutter dan Konteks Penggunaannya Masing-Masing!**
* `Container`: Layout widget ini berguna untuk mengelompokkan dan mendekorasi widget lain, seperti menentukan warna latar belakang, batas, dan padding.
* `Column`: Layout widget ini berguna untuk menyusun widget dalam kolom vertikal. Cocok untuk menata widget secara vertikal.
* `Expanded`: Layout widget ini digunakan untuk memperluas child widget dalam widget parent, terutama dalam Row dan Column untuk memberikan proporsi.
* `GridView`: Layout widget ini digunakan untuk menyusun widget dalam bentuk grid (baris dan kolom) sehingga dapat menampilkan daftar item dalam tata letak grid.
* `ListView`: Layout widget ini digunakan untuk menyusun widget dalam daftar yang dapat di-scroll. Cocok untuk menampilkan daftar item yang panjang atau dinamis.
* `Row`: Layout widget ini digunakan untuk menyusun widget dalam baris horizontal. Cocok digunakan saat ingin menampilkan beberapa widget secara berdampingan.
* `SizedBox`: Layout widget ini digunakan untuk memberikan kotak kosong dengan lebar, tinggi, atau keduanya tertentu. Berguna untuk mengatur ruang antara atau sekitar widget.
* `Stack`: Layout widget ini digunakan untuk menumpuk widget satu di atas yang lain. Cocok ketika ingin menempatkan widget di atas widget lain.
* `Wrap`: Layout widget ini digunakan untuk menyusun widget dalam baris dan kolom yang dapat melibatkan baris atau kolom baru jika tidak cukup ruang. Cocok digunakan saat ingin menampilkan banyak item dalam ruang yang terbatas.

## **Elemen Input pada Form yang Saya Pakai pada Tugas Kali Ini dan Penjelasan Mengapa Saya Menggunakan Elemen Input Tersebut**

1. `TextFormField` <br/>
`TextFormField` menyediakan kolom untuk melakukan input yang saya gunakan untuk menerima input berupa `name`, `category`, `amount`, `price`, dan `description`. TextFormField menyediakan berbagai opsi dekorasi dan validasi yang memudahkan pengguna untuk memasukkan data dengan benar.
`onChanged` digunakan untuk menangani perubahan nilai pada saat pengguna memasukkan atau mengubah teks di dalam TextFormField.  `onSaved` digunakan untuk menyimpan nilai input saat formulir dianggap valid dan disimpan. `validator` digunakan untuk memastikan bahwa input tidak kosong dan berupa tipe data yang sesuai.

2. `ElevatedButton`<br/>

`ElevatedButton` digunakan untuk membuat tombol yang muncul dengan material design. `child` dapat berisi widget lagi, dapat berupa text atau yang lainnya. `onPressed` dapat diisi dengan fungsi ketika tombol ditekan, seperti menyimpan data. `onPressed` callback pada ElevatedButton memungkinkan penentuan aksi atau logika yang akan dieksekusi ketika tombol ditekan. Pada kode saya, ketika tombol "Save" ditekan, logika disertakan untuk memvalidasi formulir, menyimpan item, dan menampilkan dialog konfirmasi.

## **Penerapan Clean Architecture pada Aplikasi Flutter?**
Penerapan Clean Architecture pada aplikasi Flutter melibatkan pembagian kode ke dalam beberapa lapisan dengan tujuan untuk menjaga pemisahan konsep-konsep bisnis inti dari implementasi teknis dan infrastruktur. Berikut adalah bagaimana penerapan Clean Architecture dengan pembagian lapisan pada Flutter:

1. *Domain*, berisi logika bisnis dan aturan aplikasi. *Domain* memungkinkan migrasi antar platform lebih mudah. 
    * Entities
    * Usecases
    * Repositories

2. *Data*, data retrival yang diambil dari database.
    * Repositories
    * Models
    * Mappers
    * Data sources

3. *Presentation/Feature*, berisi antarmuka dan *event handler* antarmuka yang berhubungan dengan tampilan pada layar.
    * Pages
    * State management
    * Widgets

4. *Device*, berfungsi untuk berkomunikasi langsung dengan platform seperti Android dan IOS, serta bertanggung jawab atas fungsional native seperti contohnya GPS.
    * Devices
    * Extra

5. *Resources* dan *Shared Library*
    Kedua layer ini dapat diakses oleh semua layar lain:
    * *Resources* berisi aset dan konfigurasi lainnya.
    * *Shared Library* berisi komponen yang dapat digunakan ulang, fungsionalitas (navigasi, jaringan, dll.), dan library pihak ketiga.