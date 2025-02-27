# ARG Noticias - Simulador de Noticias App

Creamos una aplicación que trae las noticias de Argentina y el mundo a través de una API. Usa fundamentos de Flutter y widgets.

## Integrantes

* Macarena Huarte
* Sofia Gonzalez

## Tabla de Contenidos

* [Descripción](#descripción)
* [Instalación](#instalación)
* [Funcionamiento](#funcionamiento)
* [Contenido](#contenido)
* [Pantallas](#pantallas)
* [Uso](#uso)

## Descripción

Creamos una aplicación que trae las noticias de Argentina y el mundo a través de una API. Usa fundamentos de Flutter y widgets.

## Instalación

Pasos para instalar y configurar tu proyecto localmente.

1.  **Clonar el repositorio:**

    ```bash
    git clone [https://github.com/tomasmerlo1/Prototipo-Flutter.git](https://github.com/tomasmerlo1/Prototipo-Flutter.git)
    ```

2.  **Instalar dependencias:**

    ```bash
    cd Prototipo-Flutter
    flutter pub get
    ```

3.  **Configurar variables de entorno:**

    Copia el archivo `.env.example` a `.env` y edítalo según tu IP.
    Para encontrar tu IP, abre el Símbolo del Sistema (CMD), escribe `ipconfig` y busca la línea "Dirección IPv4". Copia tu IP y colócala en el archivo `.env`.

## Uso

El proyecto fue realizado y probado en una virtualización del Pixel 8 Android 15.0 ("VanillaIceCream") | x86\_64.

## Funcionamiento

Desde la pantalla principal, puedes apreciar un menú táctil en la parte inferior. Si presionas uno de esos iconos, verás la sección de noticias, buscador y perfil. En la parte superior derecha, encontrarás el modo noche/día y la opción para iniciar sesión.

## Contenido

* **Models:**
    * `noticias_model.dart`
* **Providers:**
    * `news_provider.dart`
    * `theme_provider.dart`
* **Screens:**
    * `home_screen.dart`
    * `login_screen.dart`
    * `main_screen.dart`
    * `noticias_detalle_api_screen.dart`
    * `Noticias_screen.dart`
    * `search_screen.dart`
    * `settings_screen.dart`
* **Services:**
    * `news_api.dart`
    * `shared_prefs_service.dart`
    * `weather_api.dart`
* **Widgets:**
    * `noticias_card.dart`

## Pantallas

* **Home**

    <img src="./readme/images/homeclaro.png" />
    <img src="./readme/images/homeoscuro.png" />

* **Noticias**

    <img src="./readme/images/noticiasclaras.png" />
    <img src="./readme/images/noticiasoscuras.png" />

* **Configuraciones/Perfil**

    <img src="./readme/images/perfilclaro.png" />
    <img src="./readme/images/perdiloscuro.png" />
    <img src="./readme/images/perfilclarosinsesion.png" />

* **Registrarse / Iniciar Sesión**

    <img src="./readme/images/iniciosesionclaro.png" />
    <img src="./readme/images/iniciosesionoscuro.png" />

