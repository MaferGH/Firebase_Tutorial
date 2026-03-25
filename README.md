# Firebase Auth System con Swift

Este proyecto es una implementación sencilla y funcional de un sistema de **Login y Registro** utilizando **Swift** y **Firebase Authentication**.

---

## ¿Qué es Firebase?
[Firebase](https://firebase.google.com/) es una plataforma de Google que ofrece herramientas en la nube para facilitar la creación de apps. En este proyecto utilizamos **Firebase Authentication**, que permite gestionar usuarios de forma segura sin necesidad de configurar un servidor propio.

### Métodos de acceso:
* ✉️ Correo electrónico y contraseña.
* 🌐 Inicios de sesión con Google, Apple o Facebook.
* 👤 Autenticación anónima.

---

## Instalación y Configuración

### 1. Integrar el SDK de Firebase
Para añadir Firebase a Xcode, seguimos estos pasos:
1. Ir al menú **File** > **Add Package Dependencies**.
2. Pegar la URL: `https://github.com/firebase/firebase-ios-sdk.git`.
3. En **Dependency Rule**, seleccionar **Up to Next Major Version**.
4. Al finalizar, asegúrate de seleccionar el paquete `FirebaseAuth`.

<img width="1546" height="982" alt="Captura de pantalla 2026-03-24 a la(s) 8 37 01 p m" src="https://github.com/user-attachments/assets/2d652baf-79a7-4bfa-9184-98f287cd6f6b" />


### 2. Configuración en la Consola
1. Crea un proyecto en [Firebase Console](https://console.firebase.google.com/).
2. Registra tu App de iOS usando el **Bundle Identifier** de tu proyecto.
3. Descarga el archivo `GoogleService-Info.plist` y arrástralo dentro de tu proyecto en Xcode.


<img width="1052" height="509" alt="Captura de pantalla 2026-03-24 a la(s) 8 37 49 p m" src="https://github.com/user-attachments/assets/76787a3a-d335-46fe-b51f-8df346adedc1" />


---

## Desarrollo del Proyecto

El desarrollo se concentra en el archivo `ContentView.swift`, donde gestionamos tanto la interfaz visual como la lógica de usuario.

* **Interfaz (UI):** Pantalla limpia con campos de texto para credenciales.
* **Funciones principales:**
    * `login()`: Valida las credenciales existentes con Firebase.
    * `register()`: Registra nuevos usuarios en la base de datos de autenticación.

<p align="center">
<img src="https://github.com/user-attachments/assets/93801399-4152-4180-804e-75ea9af1c971" width="30%" alt="Login Screen" />
<img src="https://github.com/user-attachments/assets/168ea276-d845-4427-8045-972e88dbb631" width="30%" alt="Register Screen" />
</p>

---

## Prueba de Usuario
Para verificar el funcionamiento, creamos un usuario de prueba en la app. Al completar el registro, puedes ver cómo el usuario se almacena automáticamente en la sección **Authentication** de tu consola de Firebase, otorgando acceso inmediato.

<img width="981" height="784" alt="Captura de pantalla 2026-03-24 a la(s) 8 41 23 p m" src="https://github.com/user-attachments/assets/c7f35cb3-1903-49d4-b8b1-b2fe829ec175" />


---
