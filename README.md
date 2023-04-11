# TP2DPBO2023
Saya Mochamad Khaairi NIM 2106416 mengerjakan TP2 dalam mata kuliah Desain dan Pemrograman Berorientasi Objek untuk keberkahanNya maka saya tidak melakukan kecurangan seperti yang telah dispesifikasikan. Aamiin.

## Deskripsi Tugas
Buatlah program Java yang terkoneksi dengan database MySQL. Berikut spesifikasi program yang harus dibuat:
* Program bebas, kecuali program Mahasiswa dan Book Author
* Terdapat proses Create, Read, Update, dan Delete data
* Terdapat proses Autentikasi (Login, Register)*
* Menggunakan minimal 2 tabel pada database
* Harus terdapat minimal 1 properti gambar pada class yang dibuat (gambar akan ditampilkan pada UI)
* Terdapat pergantian screen pada UI
* Terdapat button navigasi untuk beralih screen
* List data ditampilkan menggunakan card (JPanel). Contoh card dengan JPanel link\
*Boleh login dan/atau register. Tidak perlu ada enkripsi password

## Desaign Program
![tp2_desain drawio](https://user-images.githubusercontent.com/100757455/231213479-6b6a5c9e-d0ed-4d55-95be-b277a7633cd0.png)

Pada program ini terdapat delapan class dengan class `Login` sebagai main class.
* `Login` : Class ini berupa JFrame yang di dalamnya terdapat atribut db (merupakan instansiasi dari class dbConnection). Pada class ini terdapat button sign up untuk membuka JFrame `Register` dan button sign in yang berfungsi untuk menangkap data dari field dan divalidasi dengan data yang ada di database.
* `Register` : Class ini berupa JFrame yang di dalamnya terdapat atribut db. Pada class ini terdapat button sign up yang berfungsi untuk menampung masukkan data dari user pada field dan memasukkannya ke database. Button cancel yang tehubung dengan method resetForm() yaitu untuk mereset form sehingga kembali kosong. Button back untuk kembali ke JFrame `Login`.
* `Main` : Class ini berupa JFrame yang merupakan panel utama, berisi JScrollPane untuk menyimpan card nantinya. Terdapat satu atribut yaitu db. Pada class ini terdapat button director dan film sebagai navigation bar untuk merubah setPanel pada JPanel untuk card, terhubung dengan method setPanel() untuk menampilkan card film dan setPanel2() untuk menampilkan card director. Terdapat button logout untuk berpindah ke JFrame `Login`. Terdapat button AddFilm yang akan membuka JFrame `addfilm` untuk melakukan penambahan data film. Terdapat button AddDirector yang akan membuka JFrame `addDirector` untuk melakukan penambahan data director.
* `cardDirector` : Class ini berupa JPanel yang berisi tampilan data director yang terdiri dari nama, usia, kebangsaan, jumlah film yang dibuat dan foto dari director tersebut. Pada class ini terdapat 8 atribut yang terdiri dari db (untuk database), film sebagai instansiasi class `Main`, lima atribut untuk menampung data director yang sebelumnya telah disebutkan dan atribut myImg yang berisi file image. Terdapat button delete yang tehubung dengan method deleteData() yaitu untuk menghapus data dari database. Terdapat button update yang akan membuka JFrame `addDirector` untuk mengubah data.
* `cardFilm` : Class ini berupa JPanel yang berisi tampilan data film yang terdiri dari judul, tahun rilis, director, pendapatan dan poster film. Pilihan data director akan menyesuaikan data dari table director. Fungsi class ini kurang lebih sama seperti class `cardDirector`.
* `addDirector` : Class ini berupa JFrame yang berisi field form untuk menambahkan dan mengubah data dari table director pada database. Pada class ini terdapat 7 atribut yang terdiri dari db untuk database, film untuk instansiasi class `Main`, isUpdate untuk penanda apakah tambah data atau ubah data, selectedID untuk menampung id dari data yang akan diubah, fileImage berisi file image yang akan diupload, filePath berisi path dari image yang akan diupload, fileName berisi nama file imagenya. Pada class ini terdapat dua constructor, satu untuk addData dan satu untuk updateData, perbedaannya terdapat pada paramater, di mana pada constructor untuk updateData terdapat paramater berisi data card card yang dipilih. Terdapat button yang akan menyesuaikan tergantung apakah add data atau update data yang terhubung dengan method insertData() dan updateData(). Terdapat button browse untuk mencari file dari directory local (untuk menambahkan foto director). Terdapat button cancel yang terhubung dengan method resetForm() yaitu untuk membersihkan field. Terdapat method uploadImage() untuk mengupload image, yang sebelumnya telah dipilih melalui button browse, ke folder local 'src/film/images/'.
* `addFilm` : Class ini berupa JFrame yang berisi field form untuk menambahkan dan mengubah data dari table film pada database. Fungsi class ini kurang lebih sama seperti class `addDirector`.
* `dbConnection` : Class ini digunakan untuk melakukan koneksi ke database. Class ini memiliki 2 atribut, yaitu stmt dan conn. Method-method yang ada di class ini digunakan untuk membantu proses query dari aplikasi ke database.

Selain di atas terdapat juga fitur tambahan sepert error handling untuk login dan register, trigger untuk jumlah film yang dibuat director yang mana akan berubah tergantung kita melakukan add data, update data atau delete data

## Desaign GUI
* From Login

![image](https://user-images.githubusercontent.com/100757455/230715933-2c8f0a90-e7ec-460a-b9ee-679574e5af39.png)
* From Register

![image](https://user-images.githubusercontent.com/100757455/230715950-5eab1e82-7941-4342-b2ae-11e0bb1089f5.png)
* Main Panel

![image](https://user-images.githubusercontent.com/100757455/230715974-851e01d3-5caf-4491-980b-603c23969204.png)
* Card Director

![image](https://user-images.githubusercontent.com/100757455/230716004-1dc56bb3-5233-4a44-b481-d76618b85b2e.png)
* Card Film

![image](https://user-images.githubusercontent.com/100757455/230716060-6ec4fd64-bfd4-4dd2-b73c-e772d425051a.png)
* Form Update dan Add data director

![image](https://user-images.githubusercontent.com/100757455/230716104-8b504728-24d9-4ccb-b881-20654bdcd5b4.png)
* Form Update dan Add data film

![image](https://user-images.githubusercontent.com/100757455/230716123-9d7bf30b-d867-4c5f-b715-bcc71b765696.png)

## Alur Program
1. User melakukan register terlebih dahulu jika belum memiliki akun, tiap field harus diisi
2. User dapat melakukan login menggunakan akun yang sebelumnya telah dibuat dan akan masuk ke main panel
3. Pada main panel, user akan melihat list data film (jika sudah ada) dan dapat berpindah halaman ke halaman director menggunakan navigasi bar. User juga dapat melakukan add data film, add data director dan logout pada halaman ini
4. Jika user hendak menambahkan data film dan menekan tombol add film maka akan keluar form untuk isi data film, begitu juga dengan tombol add director
5. Jika user telah mengisi data dan menekan tombol add pada form tambah data maka data tersebut akan ditampilkan berbentuk card pada halaman main panel
6. Pada tiap card data, user dapat menghapus atau mengubah data dari card tersebut
7. Jika user menekan tombol delete maka akan keluar kotak dialog untuk konfirmasi
8. Jika user menekan tombol update maka akan keluar form untuk mengubah data.
Note: tambahkan data director terlebih dahulu baru data film agar pilihan director pada form tambah data film terdapat data data director dan tidak kosong.

* untuk mencoba login dapat menggunakan akun berikut\
username: mokha\
password: mokha30

**Note: Jar file mungkin tidak berjalan dengan baik, jadi lebih baik jalankan program langsung melalui Netbeans dan pastikan untuk import jbdc driver ke folder lib terlebih dahulu sebelum menjalankan program**

## Dokumentasi
* Register

![image](https://user-images.githubusercontent.com/100757455/230727263-e74abff7-7fe2-4412-ae39-a3b396540f28.png)
* Main Panel

![image](https://user-images.githubusercontent.com/100757455/230727310-cfc57756-f3d2-49ef-9bee-fe1da307bee6.png)
* Add Data (film)

![image](https://user-images.githubusercontent.com/100757455/230727451-35b1f7e3-f15b-42d1-a81a-a4ed44c0a584.png)
* Update Data (director)

![image](https://user-images.githubusercontent.com/100757455/230727497-7d292756-ced0-4ea2-9cd7-3891d13f8f34.png)
* Delete Data

![image](https://user-images.githubusercontent.com/100757455/230727536-bd44137a-3226-4d77-ae12-81e85df647b5.png)
