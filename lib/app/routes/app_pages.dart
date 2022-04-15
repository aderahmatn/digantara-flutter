import 'package:get/get.dart';

import '../modules/beranda/bindings/beranda_binding.dart';
import '../modules/beranda/views/beranda_view.dart';
import '../modules/detail_akun/bindings/detail_akun_binding.dart';
import '../modules/detail_akun/views/detail_akun_view.dart';
import '../modules/forum/bindings/forum_binding.dart';
import '../modules/forum/views/forum_view.dart';
import '../modules/halodoc/bindings/halodoc_binding.dart';
import '../modules/halodoc/views/halodoc_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/informasi_desa/bindings/informasi_desa_binding.dart';
import '../modules/informasi_desa/views/informasi_desa_view.dart';
import '../modules/kontak/bindings/kontak_binding.dart';
import '../modules/kontak/views/kontak_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/loker/bindings/loker_binding.dart';
import '../modules/loker/views/loker_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/notifikasi/bindings/notifikasi_binding.dart';
import '../modules/notifikasi/views/notifikasi_view.dart';
import '../modules/pengajuan_dokumen/bindings/pengajuan_dokumen_binding.dart';
import '../modules/pengajuan_dokumen/views/buat_pengajuan_dokumen_view.dart';
import '../modules/pengajuan_dokumen/views/detail_pengajuan_dokumen_view.dart';
import '../modules/pengajuan_dokumen/views/pengajuan_dokumen_view.dart';
import '../modules/produk_saya/bindings/produk_saya_binding.dart';
import '../modules/produk_saya/views/produk_saya_view.dart';
import '../modules/profil_desa/bindings/profil_desa_binding.dart';
import '../modules/profil_desa/views/profil_desa_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/shop/bindings/shop_binding.dart';
import '../modules/shop/views/shop_view.dart';
import '../modules/sos/bindings/sos_binding.dart';
import '../modules/sos/views/sos_view.dart';
import '../modules/tani_desa/bindings/tani_desa_binding.dart';
import '../modules/tani_desa/views/tani_desa_view.dart';
import '../modules/ubah_akun/bindings/ubah_akun_binding.dart';
import '../modules/ubah_akun/views/ubah_akun_view.dart';
import '../modules/ubah_password/bindings/ubah_password_binding.dart';
import '../modules/ubah_password/views/ubah_password_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => ShopView(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: _Paths.BERANDA,
      page: () => BerandaView(),
      binding: BerandaBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HALODOC,
      page: () => HalodocView(),
      binding: HalodocBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_AKUN,
      page: () => DetailAkunView(),
      binding: DetailAkunBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_PASSWORD,
      page: () => UbahPasswordView(),
      binding: UbahPasswordBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_AKUN,
      page: () => UbahAkunView(),
      binding: UbahAkunBinding(),
    ),
    GetPage(
      name: _Paths.PENGAJUAN_DOKUMEN,
      page: () => PengajuanDokumenView(),
      binding: PengajuanDokumenBinding(),
      children: [
        GetPage(
          name: _Paths.DETAIL_PENGAJUAN_DOKUMEN,
          page: () => DetailPengajuanDokumenView(),
          binding: PengajuanDokumenBinding(),
        ),
        GetPage(
          name: _Paths.BUAT_PENGAJUAN_DOKUMEN,
          page: () => BuatPengajuanDokumenView(),
          binding: PengajuanDokumenBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.INFORMASI_DESA,
      page: () => InformasiDesaView(),
      binding: InformasiDesaBinding(),
    ),
    GetPage(
      name: _Paths.FORUM,
      page: () => ForumView(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_DESA,
      page: () => ProfilDesaView(),
      binding: ProfilDesaBinding(),
    ),
    GetPage(
      name: _Paths.LOKER,
      page: () => LokerView(),
      binding: LokerBinding(),
    ),
    GetPage(
      name: _Paths.TANI_DESA,
      page: () => TaniDesaView(),
      binding: TaniDesaBinding(),
    ),
    GetPage(
      name: _Paths.SOS,
      page: () => SosView(),
      binding: SosBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK_SAYA,
      page: () => ProdukSayaView(),
      binding: ProdukSayaBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI,
      page: () => NotifikasiView(),
      binding: NotifikasiBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK,
      page: () => KontakView(),
      binding: KontakBinding(),
    ),
  ];
}
