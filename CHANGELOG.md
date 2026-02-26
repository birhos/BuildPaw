# BuildPaw - Changelog

## v0.0.1 - MVP Release (2026-02-26)

### Yeni Özellikler

#### Çoklu Dil Desteği (i18n Genişletme)
- 6 yeni dil eklendi: Arapça (AR), Almanca (DE), Fransızca (FR), Basitleştirilmiş Çince (ZH), Rusça (RU), Hintçe (HI)
- Toplam desteklenen dil sayısı 8'e çıktı (EN, TR, AR, DE, FR, ZH, RU, HI)
- Her dil için tüm UI metinlerinin tam çevirisi
- Dil seçiciye tüm yeni diller eklendi

#### RTL (Sağdan Sola) Desteği
- Arapça seçildiğinde uygulama otomatik olarak RTL moduna geçer
- Diğer tüm dillerde LTR modu korunur
- `MaterialApp.builder` üzerinden `Directionality` widget ile explicit RTL/LTR kontrolü
- `EdgeInsets.fromLTRB` → `EdgeInsetsDirectional.fromSTEB` dönüşümleri

#### RTL'de LTR Zorlanan Alanlar
- **Terminal/Log paneli**: Kod çıktısı her zaman LTR
- **Dosya yolu TextField'ları**: Sistem yolları her zaman LTR
- **Dependency tablosu**: Paket isimleri ve versiyonlar her zaman LTR
- **Config panel input'ları**: Flavor ve target alanları (tüm platformlar) her zaman LTR

### Hata Düzeltmeleri

- Web build `--web-renderer` deprecated flag hatası düzeltildi
- FVM Dart execution desteği düzeltildi
- `file_picker` entitlement hatası düzeltildi
- `RadioListTile` ve `DropdownButtonFormField` deprecated API uyarıları düzeltildi

#### YAML Parser Top-Level Key Algılama
- `_parsePubspecYamlDeps` metodundaki top-level YAML key algılama hatası düzeltildi
- Eski kod: `!stripped.startsWith(' ')` (trimmed string'de her zaman true) ve `stripped == trimmed` (trailing whitespace kontrolü — yanlış mantık)
- Yeni kod: `!line.startsWith(' ') && !line.startsWith('\t')` ile orijinal satırda leading indentation kontrolü
- İndentli alt-key'lerin (`  git:`) yanlışlıkla top-level key olarak algılanması engellendi
- Trailing whitespace'li top-level key'lerin (`flutter_icons:  `) doğru algılanması sağlandı

#### RTL/LTR Rebuild Sorunu
- `app.dart`'daki gereksiz `Builder` widget'ı kaldırıldı
- `BlocBuilder<ThemeCubit>` artık `TranslationProvider`'a doğrudan abone
- Locale ve tema değişikliklerinde güvenilir rebuild garantisi

### Teknik Değişiklikler

#### Yeni Dosyalar
- `lib/core/i18n/ar.i18n.json` — Arapça çeviriler
- `lib/core/i18n/de.i18n.json` — Almanca çeviriler
- `lib/core/i18n/fr.i18n.json` — Fransızca çeviriler
- `lib/core/i18n/zh.i18n.json` — Basitleştirilmiş Çince çeviriler
- `lib/core/i18n/ru.i18n.json` — Rusça çeviriler
- `lib/core/i18n/hi.i18n.json` — Hintçe çeviriler

#### Güncellenen Dosyalar
- `lib/core/i18n/en.i18n.json` / `tr.i18n.json` — Yeni dil isim key'leri eklendi
- `lib/core/i18n/strings*.g.dart` — Slang ile 8 locale için yeniden oluşturuldu
- `lib/app.dart` — RTL/LTR desteği, Builder kaldırıldı, locale doğrudan BlocBuilder context'inde
- `lib/presentation/widgets/language_selector.dart` — 8 dil seçeneği
- `lib/presentation/widgets/project_info_card.dart` — `EdgeInsetsDirectional`, dependency tablosu LTR
- `lib/presentation/widgets/build_log_panel.dart` — Terminal çıktısı LTR
- `lib/presentation/widgets/project_selector_widget.dart` — Dosya yolu LTR
- `lib/presentation/widgets/platform_config/android_config_panel.dart` — Flavor/target LTR
- `lib/presentation/widgets/platform_config/ios_config_panel.dart` — Flavor/target LTR
- `lib/presentation/widgets/platform_config/web_config_panel.dart` — Flavor/target LTR
- `lib/infrastructure/services/flutter_service.dart` — YAML parser top-level key algılama düzeltmesi

---



#### Profil Yönetimi
- Uygulama içi **profil modu** eklendi
- Mevcut build konfigürasyonları isim + versiyon ile profil olarak kaydedilebilir
- Kaydedilen profiller `shared_preferences` ile cihazda kalıcı olarak saklanır
- Profil listesinden tek tıkla konfigürasyon uygulanabilir
- Aktif profilin üzerine kaydetme (save) desteği
- Aynı isimde profil varsa üzerine yazma onayı
- Profil silme (onay dialogu ile)

#### Profil Selector (Sağ Üst Menü)
- Profil alanı sağ üst köşeye `PopupMenuButton` olarak taşındı
- Dil ve tema seçicileriyle tutarlı tasarım
- Bölüm başlığı, radio-button stili ikonlar, iki satırlı profil itemları (isim + versiyon)
- Aktif profil varsa ikon rengi primary (turuncu)
- Menü içinde: profil listesi, kaydet, yeni profil, sil aksiyonları

#### Project Info TabBar Yapısı
- `ProjectInfoCard` iki tab'lı yapıya dönüştürüldü:
  - **General**: Proje adı, versiyon, branch, tag, Flutter/Dart sürümleri, FVM durumu
  - **Dependencies**: `pubspec.yaml` ve `pubspec.lock`'tan okunan tüm bağımlılıklar
- Dependencies tabında:
  - Alfabetik sıralanmış tablo görünümü
  - PACKAGE / VERSION sütun başlıkları
  - Zebra-stripe satır renklendirmesi
  - Monospace font ile versiyon numaraları
  - Tab başlığında paket sayısı: `Dependencies (12)`

#### Gerçek Dependency Versiyonları
- Dependency versiyonları artık `pubspec.lock` dosyasından okunur (resolved/actual version)
- Lock dosyası yoksa `pubspec.yaml`'daki constraint versiyonu gösterilir
- `^9.1.0` yerine `9.1.0` gibi gerçek çözümlenmiş versiyonlar

### UI/UX İyileştirmeleri

#### Popup Menü Tasarım Revizyonu
- Tüm popup menü butonları (profil, tema, dil) tutarlı tasarıma kavuşturuldu
- `popupMenuTheme` her iki temaya da eklendi (12px radius, 8 elevation, ince kenarlık)
- Tutarlı tasarım deseni:
  - `PopupMenuPosition.under` ile menüler butonun altında açılır
  - `constraints` ile tutarlı menü genişliği
  - Seçili item: `fontWeight: w600` + primary renk + sağda check ikonu
  - Sabit item yükseklikleri (40px)
  - 20px buton ikonları, 16px menü içi ikonlar
- **Tema Seçici**: `dark_mode_rounded` / `light_mode_rounded` ikonlar
- **Dil Seçici**: "EN" / "TR" text badge'ler, 11px bold
- **Profil Seçici**: Radio-button stili, iki satırlı itemlar, minimal close ikonu

### Teknik Değişiklikler

#### Yeni Dosyalar
- `lib/infrastructure/services/profile_storage_service.dart` — SharedPreferences ile profil CRUD
- `lib/application/profile/profile_cubit.dart` — Profil state yönetimi
- `lib/application/profile/profile_state.dart` — Profil state modeli
- `lib/presentation/widgets/profile_panel.dart` — ProfileSelector PopupMenuButton
- `lib/presentation/widgets/save_profile_dialog.dart` — Profil kaydetme dialogu

#### Güncellenen Dosyalar
- `lib/infrastructure/services/flutter_service.dart` — `getDependencies()`, `_parseLockFileVersions()` eklendi
- `lib/domain/models/project_info.dart` — `dependencies` alanı eklendi
- `lib/application/project/project_cubit.dart` — Dependency fetch paralel olarak yapılıyor
- `lib/presentation/widgets/project_info_card.dart` — TabBar + AnimatedCrossFade ile tab yapısı
- `lib/presentation/widgets/theme_selector.dart` — Tutarlı popup menü tasarımı
- `lib/presentation/widgets/language_selector.dart` — Tutarlı popup menü tasarımı
- `lib/presentation/widgets/project_selector_widget.dart` — Header'a ProfileSelector eklendi
- `lib/presentation/pages/home_page.dart` — ProfilePanel card kaldırıldı
- `lib/core/theme/app_theme.dart` — `popupMenuTheme` eklendi (dark + light)
- `lib/core/i18n/en.i18n.json` / `tr.i18n.json` — Profil ve dependency çevirileri

---



#### Lokalizasyon Desteği
- Slang ile i18n altyapısı eklendi (EN / TR)
- Tüm UI metinleri çeviri dosyalarından okunur
- Sağ üst köşede dil seçici

#### Tema Desteği
- Light tema eklendi
- Dark/Light tema geçişi
- Sağ üst köşede tema seçici
- Tema tercihi kalıcı olarak saklanır

#### Drag & Drop Config Import
- JSON dosyasını sürükle-bırak ile yapılandırma içe aktarma
- `desktop_drop` + `cross_file` entegrasyonu
- Drop zone overlay gösterimi

#### Config Export/Import
- Mevcut yapılandırmayı versiyonlu JSON olarak dışa aktarma
- JSON preset dosyasını içe aktararak tüm alanları otomatik doldurma
- Postman collection benzeri metadata yapısı

#### Proje Bilgisi Geliştirmeleri
- Proje versiyonu gösterimi
- Refresh butonu ile bilgileri yeniden çekme
- Son git tag versiyonu gösterimi

#### Log Kopyalama
- Build log paneline kopyalama butonu eklendi
- Her log satırına newline eklenerek panoya kopyalama

---

### Proje Yapısı

```
lib/
  main.dart                                  # Uygulama giriş noktası
  app.dart                                   # MultiBlocProvider + MaterialApp kurulumu
  core/
    theme/
      app_theme.dart                         # Material 3 dark tema
      app_colors.dart                        # Paw-themed renk paleti (amber/turuncu)
    constants/
      app_constants.dart                     # Sabit değerler
  domain/
    enums/
      build_mode.dart                        # debug / profile / release
      android_output_type.dart               # apk / aab / both
      ios_output_type.dart                   # ios / ipa
      pwa_strategy.dart                      # default / none
      build_platform.dart                    # android / ios / web
    models/
      project_info.dart                      # Proje bilgileri modeli
      android_build_config.dart              # Android yapılandırma modeli
      ios_build_config.dart                  # iOS yapılandırma modeli
      web_build_config.dart                  # Web yapılandırma modeli
      build_result.dart                      # Build sonuç modeli
      build_preset.dart                      # Export/Import preset modeli
  application/
    project/                                 # Proje seçimi ve bilgi yükleme
    build_config/                            # Platform enable/disable + config yönetimi
    build_execution/                         # Build süreci yönetimi
    services/                                # Command generator + artifact manager
  infrastructure/
    services/                                # Process, Git, Flutter, FileSystem servisleri
  presentation/
    pages/home_page.dart                     # Ana sayfa
    widgets/                                 # Tüm UI widget'ları
```

### Özellikler

#### Proje Seçimi ve Bilgi Gösterimi
- Finder üzerinden Flutter proje dizini seçimi
- `pubspec.yaml` varlık kontrolü ile validasyon
- Proje bilgileri otomatik yükleme (ad, versiyon, branch, tag, Flutter/Dart sürüm, FVM)

#### Platform Bazlı Build Yapılandırması
- **Android**: APK / AAB / ikisi birden, obfuscation, split debug info, flavor, build mode, target
- **iOS**: Runner.app / IPA, obfuscation, split debug info, flavor, build mode, target
- **Web**: PWA strategy, no tree shake icons, flavor, build mode, target

#### Build Çalıştırma
- CLI komutları otomatik oluşturma
- FVM algılandığında `fvm flutter` prefix
- Real-time log streaming
- Sıralı platform build (Android → iOS → Web)
- Cancel desteği

#### Log Paneli
- Terminal-style görüntüleyici (JetBrains Mono)
- Renk kodlu log satırları
- Otomatik alta kayma
- Durum badge: Idle / Running / Success / Failed

#### Artifact Yönetimi
- Build sonrası otomatik artifact toplama
- Masaüstünde zaman damgalı klasör yapısı
- Build sonrası Finder otomatik açılır

### Teknik Detaylar
- **State Management**: Bloc / Cubit (flutter_bloc)
- **UI Framework**: Material Design 3
- **macOS**: Sandbox devre dışı, file read-write izni
- **Minimum Pencere**: 1000x700
- **Bağımlılıklar**: flutter_bloc, equatable, file_picker, google_fonts, shared_preferences, slang
