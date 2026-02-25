# BuildPaw - Changelog

## v1.0.0 - MVP Release (2026-02-25)

### Proje Yapisi

```
lib/
  main.dart                                  # Uygulama giris noktasi
  app.dart                                   # MultiBlocProvider + MaterialApp kurulumu
  core/
    theme/
      app_theme.dart                         # Material 3 dark tema
      app_colors.dart                        # Paw-themed renk paleti (amber/turuncu)
    constants/
      app_constants.dart                     # Sabit degerler (artifact yollari, varsayilanlar)
  domain/
    enums/
      build_mode.dart                        # debug / profile / release
      android_output_type.dart               # apk / aab / both
      ios_output_type.dart                   # ios / ipa
      web_renderer.dart                      # html / canvaskit / auto
      pwa_strategy.dart                      # default / none
      build_platform.dart                    # android / ios / web
    models/
      project_info.dart                      # Proje bilgileri modeli
      android_build_config.dart              # Android yapilandirma modeli (toJson/fromJson)
      ios_build_config.dart                  # iOS yapilandirma modeli (toJson/fromJson)
      web_build_config.dart                  # Web yapilandirma modeli (toJson/fromJson)
      build_result.dart                      # Build sonuc modeli
      build_preset.dart                      # Export/Import preset modeli (Postman-style)
  application/
    project/
      project_cubit.dart                     # Proje secimi ve bilgi yukleme
      project_state.dart                     # ProjectInitial / Loading / Loaded / Error
    build_config/
      build_config_cubit.dart                # Platform enable/disable + config yonetimi + export/import
      build_config_state.dart                # Aktif platformlar ve yapilandirma durumu
    build_execution/
      build_execution_bloc.dart              # Build sureci yonetimi (sirali calistirma + artifact toplama)
      build_execution_event.dart             # BuildStarted / LogReceived / Cancelled
      build_execution_state.dart             # Idle / Running / Success / Error + LogEntry
    services/
      build_command_generator.dart           # UI config -> CLI komut donusumu
      artifact_manager.dart                  # Build ciktilarini toplama ve Finder acma
  infrastructure/
    services/
      process_service.dart                   # Process.start() wrapper, stream-based log ciktisi
      git_service.dart                       # Branch ve tag bilgisi cekme
      flutter_service.dart                   # Flutter/Dart versiyon, proje validasyonu, FVM algilama
      file_system_service.dart               # Dizin olusturma, kopyalama, Finder acma
  presentation/
    pages/
      home_page.dart                         # Ana sayfa (tek sayfa, scrollable)
    widgets/
      project_selector_widget.dart           # Dizin secici (file_picker + validasyon)
      project_info_card.dart                 # Proje bilgi chipleri + refresh butonu
      build_action_bar.dart                  # BUILD / Cancel butonlari
      build_log_panel.dart                   # Terminal-style log goruntuleyici + copy butonu
      export_config_dialog.dart              # Export icin isim/versiyon dialog'u
      platform_config/
        android_config_panel.dart            # Android yapilandirma paneli
        ios_config_panel.dart                # iOS yapilandirma paneli
        web_config_panel.dart                # Web yapilandirma paneli
```

### Ozellikler

#### Proje Secimi ve Bilgi Gosterimi
- Finder uzerinden Flutter proje dizini secimi
- `pubspec.yaml` varlik kontrolu ile validasyon
- Proje bilgileri otomatik yukleme:
  - Proje adi (`pubspec.yaml` -> `name`)
  - Proje versiyonu (`pubspec.yaml` -> `version`)
  - Aktif branch (`git branch --show-current`)
  - Son git tag'i (`git describe --tags --abbrev=0`)
  - Flutter versiyonu (`flutter --version --machine`)
  - Dart versiyonu (`dart --version`)
  - FVM durumu (`.fvm/` klasor kontrolu)
- Bilgileri yeniden cekme icin refresh butonu

#### Platform Bazli Build Yapilandirmasi

**Android:**
- Cikti tipi: sadece APK / sadece AAB / ikisi birden
- Code obfuscation (`--obfuscate`)
- Split debug info (`--split-debug-info=build/symbols`)
- Flavor girisi (`--flavor`)
- Build modu: debug / profile / release
- Target dosya girisi (`--target`)

**iOS:**
- Cikti tipi: ios (Runner.app) / ipa (exportable)
- Code obfuscation, split debug info, flavor, build modu, target

**Web:**
- PWA strategy: default / none
- No tree shake icons (`--no-tree-shake-icons`)
- Flavor, build modu, target

#### Build Calistirma
- Secili platformlar icin CLI komutlari otomatik olusturma
- FVM algilandiginda otomatik `fvm flutter` prefix'i
- `Process.start()` ile real-time log streaming
- Sirali platform build'i (Android -> iOS -> Web)
- Build sirasinda cancel destegi
- Build durumunu gosteren ilerleme gostergesi

#### Log Paneli
- Terminal-style koyurenkli arka plan, monospace font (JetBrains Mono)
- Otomatik alta kayma
- Renk kodlu log satirlari:
  - Basliklar: turuncu (primary)
  - Hatalar: kirmizi
  - Basari: yesil
  - Normal: gri
- Durum badge'i: Idle / Running / Success / Failed
- Loglari panoya kopyalama butonu

#### Artifact Yonetimi
- Build tamamlandiginda otomatik artifact toplama:
  - Android APK: `build/app/outputs/flutter-apk/`
  - Android AAB: `build/app/outputs/bundle/`
  - iOS IPA: `build/ios/ipa/`
  - Web: `build/web/`
- Masaustunde zaman damgali klasor yapisi:
  ```
  ~/Desktop/BuildPaw_Outputs/
      ProjeAdi/
          YYYY-MM-DD_HH-mm/
              android/
              ios/
              web/
  ```
- Build sonrasi Finder otomatik acilir

#### Config Export/Import (Postman-Style)
- Mevcut yapilandirmayi versiyonlu JSON olarak disari aktarma
- JSON preset dosyasini iceri aktararak tum alanlari otomatik doldurma
- Postman collection benzeri metadata yapisi:
  ```json
  {
    "info": {
      "name": "my-config",
      "version": "1.0.0",
      "exportedAt": "2026-02-25T14:30:00Z",
      "buildPawVersion": "1.0.0"
    },
    "platforms": { ... },
    "android": { ... },
    "ios": { ... },
    "web": { ... }
  }
  ```

### Teknik Detaylar

- **State Management:** Bloc / Cubit (flutter_bloc)
- **UI Framework:** Material Design 3, dark tema
- **macOS Entitlements:** Sandbox devre disi, file read-write izni
- **Minimum Pencere Boyutu:** 1000x700
- **Bagimliliklar:** flutter_bloc, equatable, file_picker, google_fonts

### macOS Yapilandirmasi
- `DebugProfile.entitlements` ve `Release.entitlements` guncellendi
- App sandbox devre disi (`com.apple.security.app-sandbox: false`)
- Dosya okuma/yazma izni (`com.apple.security.files.user-selected.read-write: true`)
- Ag istemci izni (`com.apple.security.network.client: true`)
- `MainFlutterWindow.swift` uzerinden minimum pencere boyutu ve baslik ayarlandi
