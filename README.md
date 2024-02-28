# verifik
- v1.0.0
- Video probando su funcionalidad: (https://www.youtube.com/watch?v=VG3jZsG-oNU)


Esta aplicacion esta Modularizada, en el Modulo
GlobalModule, esta el ChildRoute:Demo.
Este funciona como un contenedor que da prioridad(Visibilidad) a la vista que este selected.

Tiene un bloc llamado BlocDemo, donde por ejemplo hay eventos como:
- ChangePassNumberEvent: Sirve para cambiar el numero del paso selected.
- GetDetailsEvent: Hace la logica de buscar la informacion(API) en scan-demo.
- GetLivenessDataEvent: Con la selfie que la persona se toma, busca la informacion(En la API.)
- GetCompareRecognitionEvent: Consulta la informacion(Va a la API) con la selfie y la imagen cargada del dispositivo.

Vistas:
- ScanningPage:
  Es la vista que se muestra cuando se esta escaneando. PASO 1.
- DocumentPage:
  Es la vista que se muestra cuando se esta en Document details. PASO 2.
- CameraPage:
  Es la vista que se muestra cuando se esta en Liveness check. PASO 3.
- CameraPage:
  Es la vista que se muestra cuando se esta en Result. PASO 4.

Adicionalmente, le dejo algunas funcionalidades usadas:

- Manejador de estado: BLOC.
- Modular.
- Dio.
- testUnit a Bloc, con escenarios OK y ERROR.
