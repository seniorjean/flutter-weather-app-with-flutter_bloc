# 🌤️ Application Météo Flutter

Une application Flutter moderne qui fournit les **prévisions météorologiques** en temps réel basées sur la **géolocalisation** de l'utilisateur.

## 📱 Aperçu de l'Application

<img src="https://raw.githubusercontent.com/seniorjean/flutter-weather-app-with-flutter_bloc/refs/heads/master/app-preview.png" width="300px">

## ✨ Fonctionnalités

- 🌍 **Géolocalisation automatique** - Obtient automatiquement votre position
- 🌡️ **Météo en temps réel** - Affichage des conditions météorologiques actuelles
- 📅 **Prévisions étendues** - Prévisions sur plusieurs jours
- 🎨 **Interface moderne** - Design épuré et intuitif
- 📱 **Compatible iOS/Android** - Fonctionne sur les deux plateformes
- ⚡ **Gestion d'état avec BLoC** - Architecture robuste et scalable
- 🔄 **Rafraîchissement automatique** - Mise à jour régulière des données

## 🛠️ Technologies Utilisées

- **Flutter** - Framework de développement multi-plateforme
- **Dart** - Langage de programmation
- **BLoC Pattern** - Gestion d'état réactive
- **API Météo** - Service de données météorologiques
- **Géolocalisation** - Services de localisation natifs

## 📦 Dépendances

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6      # Icônes iOS
  weather: ^3.1.1              # API météorologique
  flutter_bloc: ^8.1.6         # Gestion d'état BLoC
  equatable: ^2.0.5            # Comparaison d'objets
  intl: ^0.19.0               # Internationalisation
  geolocator: ^13.0.1         # Géolocalisation
```

## 🚀 Installation et Configuration

### Prérequis

- **Flutter SDK** (version 3.0 ou supérieure)
- **Dart SDK** (inclus avec Flutter)
- **Android Studio** ou **VS Code** avec extensions Flutter/Dart
- **Émulateur Android/iOS** ou **appareil physique**
- **Clé API météo** (OpenWeatherMap ou similaire)

### 1. Cloner le Projet

```bash
git clone https://github.com/votre-username/flutter-weather-app.git
cd flutter-weather-app
```

### 2. Installer les Dépendances

```bash
flutter pub get
```

### 3. Configuration de l'API Météo

1. **Obtenir une clé API** :
   - Rendez-vous sur [OpenWeatherMap](https://openweathermap.org/api)
   - Créez un compte gratuit
   - Générez une clé API

2. **Configurer la clé API** :
   Créez un fichier `lib/config/api_config.dart` :
   ```dart
   class ApiConfig {
     static const String weatherApiKey = 'VOTRE_CLE_API_ICI';
     static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
   }
   ```

### 4. Configuration des Permissions

#### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
```

#### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Cette application a besoin d'accéder à votre localisation pour fournir les prévisions météo.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Cette application utilise la localisation pour afficher la météo de votre région.</string>
```

### 5. Lancement de l'Application

#### Avec VS Code
1. **Ouvrir le projet** dans VS Code
2. **Sélectionner un émulateur/appareil** (F1 > Flutter: Select Device)
3. **Appuyer sur F5** ou cliquer sur "Run and Debug"

#### Avec Android Studio
1. **Ouvrir le projet** dans Android Studio
2. **Sélectionner un émulateur/appareil** dans la barre d'outils
3. **Cliquer sur le bouton Run** ▶️

#### Avec la ligne de commande
```bash
# Lister les appareils disponibles
flutter devices

# Lancer en mode debug
flutter run

# Lancer en mode release
flutter run --release

# Pour un appareil spécifique
flutter run -d <device-id>
```

## 🏗️ Architecture du Projet

```
lib/
├── bloc/                 # Logique métier (BLoC)
│   ├── weather_bloc.dart
│   ├── weather_event.dart
│   └── weather_state.dart
├── config/              # Configuration
│   └── api_config.dart
├── models/              # Modèles de données
│   └── weather_model.dart
├── repositories/        # Accès aux données
│   └── weather_repository.dart
├── screens/             # Écrans de l'application
│   ├── home_screen.dart
│   └── settings_screen.dart
├── widgets/             # Widgets réutilisables
│   ├── weather_card.dart
│   └── forecast_list.dart
├── utils/               # Utilitaires
│   └── constants.dart
└── main.dart           # Point d'entrée
```


## 🔧 Fonctionnalités Détaillées

### 🌍 Géolocalisation
- Détection automatique de la position
- Gestion des permissions de localisation
- Mode hors ligne avec dernière position connue

### 🌤️ Données Météorologiques
- Température actuelle et ressentie
- Humidité et pression atmosphérique
- Vitesse et direction du vent
- Visibilité et indice UV
- Prévisions sur 7 jours

### 📱 Interface Utilisateur
- Design Material Design 3
- Thème sombre/clair
- Animations fluides
- Indicateurs de chargement
- Gestion des erreurs

## ⚙️ Configuration Avancée

### Variables
Changer la veur de `weatherApiKey` dans lib/ApiConstants.dart
weatherApiKey=votre_cle_api


### Build de Production

#### Android
```bash
# Générer l'APK
flutter build apk --release

# Générer l'App Bundle (recommandé pour Google Play)
flutter build appbundle --release
```

#### iOS
```bash
# Build pour iOS
flutter build ios --release
```

## 🧪 Tests

### Lancer les Tests
```bash
# Tests unitaires
flutter test

# Tests d'intégration
flutter test integration_test/

# Tests avec couverture
flutter test --coverage
```

### Tests Inclus
- Tests unitaires pour les BLoCs
- Tests de widgets
- Tests d'intégration
- Tests de l'API météo

## 🔍 Dépannage

### Problèmes Courants

**Erreur de géolocalisation :**
```bash
# Vérifier les permissions dans les paramètres de l'appareil
# S'assurer que la localisation est activée
```

**Erreur API :**
- Vérifier la clé API dans `api_config.dart`
- Contrôler la connexion internet
- Vérifier les quotas de l'API

**Build échoue :**
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

**Problème de permissions iOS :**
- Vérifier `Info.plist`
- Tester sur appareil physique
- Redémarrer l'application

## 📈 Améliorations Futures

- [ ] **Notifications push** pour les alertes météo
- [ ] **Widgets d'écran d'accueil** (Android/iOS)
- [ ] **Mode offline** avec cache des données
- [ ] **Cartes météo** interactives
- [ ] **Partage** des prévisions
- [ ] **Thèmes personnalisés**
- [ ] **Support multi-langues**

## 🤝 Contribution

Les contributions sont les bienvenues ! Pour contribuer :

1. **Fork** le projet
2. **Créer une branche** (`git checkout -b feature/nouvelle-fonctionnalite`)
3. **Commit** vos changements (`git commit -am 'Ajout nouvelle fonctionnalité'`)
4. **Push** vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. **Créer une Pull Request**

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.


## 🙏 Remerciements

- [OpenWeatherMap](https://openweathermap.org/) pour l'API météo
- [Flutter Team](https://flutter.dev/) pour le framework
- [BLoC Library](https://bloclibrary.dev/) pour la gestion d'état
- Communauté Flutter pour les retours et suggestions

---

**Développé avec ❤️ et Flutter**
