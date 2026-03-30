# Garder MainActivity
-keep class ci.monsupermarche.app.** { *; }

# WebView JavaScript interface
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Garder les annotations
-keepattributes *Annotation*
-keepattributes JavascriptInterface

# Éviter obfuscation des classes Android système
-keep public class android.webkit.** { *; }
