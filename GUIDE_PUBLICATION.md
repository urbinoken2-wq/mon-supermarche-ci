# 📱 Guide Publication — Mon Supermarché CI
# Play Store via Android WebView
# Référence : KDU-001 | Auteur : Kan Douedon Urbain
# ════════════════════════════════════════════════════

## ÉTAPE 1 — Préparer le projet Android Studio

### 1.1 Installer Android Studio
→ https://developer.android.com/studio
→ Version recommandée : Android Studio Hedgehog (2023.1.1) ou plus récent

### 1.2 Importer le projet
1. Ouvrir Android Studio
2. "Open" → sélectionner le dossier MonSupermarcheCI/
3. Attendre la synchronisation Gradle (peut prendre 5-10 min la 1ère fois)

### 1.3 Placer votre fichier HTML
→ Copier index1.html dans :
   MonSupermarcheCI/app/src/main/assets/index1.html

### 1.4 Modifier l'URL en ligne
→ Ouvrir : app/src/main/java/ci/monsupermarche/app/MainActivity.java
→ Ligne 14 : remplacer "https://votre-domaine.ci/index.html"
   par votre vraie URL (ex: https://monsupermarche.ci/app)

### 1.5 Ajouter l'icône de l'application
→ Dans Android Studio : clic droit sur "res" → New → Image Asset
→ Choisir votre logo (PNG 512×512 minimum)
→ Cela génère automatiquement toutes les tailles (hdpi, xhdpi, xxhdpi, xxxhdpi)

### 1.6 Tester sur émulateur ou téléphone
→ Connecter votre téléphone Android en mode développeur
→ Cliquer le bouton ▶ Run dans Android Studio
→ Vérifier que l'app se charge bien (online et offline)

---

## ÉTAPE 2 — Signer l'APK (obligatoire pour Play Store)

### 2.1 Générer le keystore (une seule fois, à conserver précieusement !)
→ Dans Android Studio : Build → Generate Signed Bundle / APK
→ Choisir "APK"
→ Cliquer "Create new..." pour créer le keystore
→ Remplir :
   - Key store path : mon-supermarche-ci.jks (dans le projet)
   - Password : (choisir un mot de passe fort)
   - Alias : monsupermarcheci
   - Validity : 25 years
   - Certificate : votre nom complet, CI, etc.

⚠️ IMPORTANT : Sauvegarder ce fichier .jks et le mot de passe en lieu sûr.
   Sans lui, vous ne pourrez plus mettre à jour l'app sur le Play Store !

### 2.2 Activer la signature dans build.gradle
→ Décommenter les lignes dans signingConfigs release :
   storeFile     file("mon-supermarche-ci.jks")
   storePassword "votre_mot_de_passe"
   keyAlias      "monsupermarcheci"
   keyPassword   "votre_mot_de_passe"
→ Décommenter aussi : signingConfig signingConfigs.release

### 2.3 Générer l'APK signé
→ Build → Generate Signed Bundle / APK → APK → release
→ L'APK se trouve dans : app/release/app-release.apk

---

## ÉTAPE 3 — Créer le compte Google Play Console

### 3.1 Créer le compte
→ https://play.google.com/console
→ Payer les 25 USD (frais uniques, carte bancaire)
→ Utiliser un compte Google dédié à votre business

### 3.2 Préparer les assets Play Store
Vous aurez besoin de :
□ Icône app       : 512×512 PNG (fond uni, pas de transparence)
□ Icône feature   : 1024×500 PNG (bannière horizontale)
□ Captures écran  : 2 à 8 screenshots téléphone (min 320px, max 3840px)
□ Description courte : max 80 caractères
□ Description longue : max 4000 caractères

Exemple description courte :
"🛒 Supermarché en ligne livré à domicile en Côte d'Ivoire"

Exemple description longue :
"Mon Supermarché CI est l'application e-commerce de référence pour
faire vos courses en Côte d'Ivoire. Commandez en ligne et recevez
vos produits via Yango, Zem, Taxi ou Woro-woro.
✅ +1000 produits : épicerie, fruits, viandes, hygiène...
✅ Commande via WhatsApp
✅ Programme de fidélité (Bronze / Argent / Or)
✅ Disponible en Français, Dioula, Anglais, Arabe
✅ Mode hors-ligne disponible"

---

## ÉTAPE 4 — Soumettre sur Play Console

### 4.1 Créer l'application
→ Play Console → "Créer une application"
→ Langue : Français
→ Titre : Mon Supermarché CI
→ Application ou Jeu : Application
→ Gratuite ou Payante : Gratuite

### 4.2 Remplir toutes les sections requises
□ Informations sur l'application (description, catégorie : Shopping)
□ Graphismes (icônes + captures)
□ Contenu de l'application (classification IARC : tous publics)
□ Accès à l'application (si pas besoin de connexion : aucun accès requis)
□ Publicités : Non
□ Catégorie de contenu : Shopping / E-commerce

### 4.3 Uploader l'APK
→ Version → Pistes → Production → Créer une version
→ Uploader l'APK : app-release.apk
→ Notes de version (ex: "Version 1.0 — Lancement initial")

### 4.4 Soumettre en révision
→ Vérifier tous les points ✅
→ "Envoyer en révision"
→ Délai : 2 à 7 jours ouvrés (souvent 24-48h)

---

## RÉCAPITULATIF COÛTS

| Item                    | Coût         |
|-------------------------|--------------|
| Compte Play Console     | 25 USD (unique) |
| Android Studio          | Gratuit      |
| Hébergement app web     | Variable     |
| Domaine .ci             | ~15 000 FCFA/an |
| Publication Play Store  | Gratuit      |

---

## CONTACT SUPPORT

En cas de blocage, les sections Play Console les plus communes :
- "Déclaration sur les données" : indiquer que l'app collecte des numéros
  WhatsApp pour les commandes
- "Contenu ciblant les enfants" : Non
- Permission Internet : justifier par "chargement du catalogue produits"

---
© KDU-001 — Mon Supermarché CI v1.0
