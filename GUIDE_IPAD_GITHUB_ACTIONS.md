# 📱 Guide — Générer l'APK depuis iPad via GitHub Actions
# Mon Supermarché CI — KDU-001
# ════════════════════════════════════════════════════════

## VUE D'ENSEMBLE
GitHub Actions va compiler votre APK gratuitement dans le cloud.
Tout se fait depuis le navigateur Safari de votre iPad.

---

## ÉTAPE 1 — Créer un compte GitHub (si pas encore fait)
→ Ouvrir Safari → https://github.com
→ Cliquer "Sign up"
→ Choisir un email + mot de passe
→ Plan gratuit suffit ✅

---

## ÉTAPE 2 — Créer le repository

1. Sur GitHub → cliquer le "+" en haut à droite
2. "New repository"
3. Repository name : MonSupermarcheCI
4. Visibility : Private (pour protéger votre code)
5. Cliquer "Create repository"

---

## ÉTAPE 3 — Uploader les fichiers du projet

Sur la page du repository vide :
1. Cliquer "uploading an existing file"
2. Uploader le fichier ZIP : MonSupermarcheCI_PlayStore.zip
3. GitHub va extraire automatiquement OU...

OU méthode manuelle (recommandée) :
1. Cliquer "Add file" → "Upload files"
2. Uploader les fichiers un par un dans leur dossier respectif

Structure à recréer sur GitHub :
```
MonSupermarcheCI/
├── .github/workflows/build-apk.yml   ← IMPORTANT !
├── app/
│   ├── src/main/
│   │   ├── assets/index1.html
│   │   ├── java/ci/monsupermarche/app/MainActivity.java
│   │   ├── AndroidManifest.xml
│   │   └── res/...
│   ├── build.gradle
│   └── proguard-rules.pro
├── build.gradle
├── settings.gradle
├── gradlew
└── gradle/wrapper/gradle-wrapper.properties
```

---

## ÉTAPE 4 — Générer le Keystore (signature APK)

⚠️ Cette étape est OBLIGATOIRE pour Play Store.

### Méthode depuis iPad — Utiliser keytool online :
→ https://keystore-generator.com
OU
→ https://play.google.com/console peut générer une clé

### Informations à saisir :
- Alias : monsupermarcheci
- Password : (choisir un mot de passe fort, ex: MSC@2026!)
- Validity : 25 years
- First and Last Name : Kan Douedon Urbain
- Organization : Mon Supermarche CI
- City : Abidjan
- Country Code : CI

→ Télécharger le fichier .jks généré
→ Convertir en Base64 :
   Sur Safari → https://base64.guru/converter/encode/file
   Uploader le .jks → copier le résultat Base64

---

## ÉTAPE 5 — Configurer les GitHub Secrets

Ces secrets protègent votre keystore. Personne ne peut les voir.

1. Sur votre repository GitHub
2. Settings → Secrets and variables → Actions
3. Cliquer "New repository secret" pour chacun :

| Nom du secret      | Valeur à coller          |
|--------------------|--------------------------|
| KEYSTORE_BASE64    | (le texte Base64 du .jks)|
| KEY_ALIAS          | monsupermarcheci         |
| KEYSTORE_PASSWORD  | (votre mot de passe)     |
| KEY_PASSWORD       | (votre mot de passe)     |

---

## ÉTAPE 6 — Lancer le build

1. Sur GitHub → onglet "Actions"
2. Cliquer "Build APK — Mon Supermarché CI"
3. Cliquer "Run workflow" → "Run workflow" (bouton vert)
4. Attendre ~5-10 minutes ⏳
5. Cliquer sur le build terminé ✅
6. Télécharger l'artefact : "MonSupermarcheCI-APK"
7. Vous obtenez : MonSupermarcheCI-v1.0.apk 🎉

---

## ÉTAPE 7 — Soumettre sur Play Console

1. Aller sur https://play.google.com/console
2. Créer un compte (25 USD)
3. "Créer une application"
4. Uploader le fichier .apk téléchargé
5. Remplir les informations de l'app
6. Soumettre en révision

---

## EN CAS DE PROBLÈME

❌ Build échoue → Cliquer sur le build rouge → lire les logs
❌ Erreur "Keystore" → Vérifier que les 4 secrets sont bien configurés
❌ Erreur Gradle → Vérifier que tous les fichiers sont uploadés

---
© KDU-001 — Mon Supermarché CI v1.0
Conçu et développé en Côte d'Ivoire 🇨🇮
