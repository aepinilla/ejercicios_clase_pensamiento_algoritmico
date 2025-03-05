// Basado en el trabajo de Joanne Martin, Adaptado por Andrés Pinilla


// Importamos la librería Minim para manejar audio y FFT
import ddf.minim.*;
import ddf.minim.analysis.*;

// Inicialización de la librería Minim y variables de audio
Minim minim;
AudioPlayer player;
FFT fft;

// Variables para la posición y tamaño de la visualización
int x = 0;
int y = 50;
float rad; // Radio del círculo generado con base en el audio

void setup() {
  size(900, 700); // Establecemos el tamaño de la ventana
  background(0); // Fondo negro

  // Inicializamos la instancia de Minim
  minim = new Minim(this);

  // Cargamos el archivo de audio
  // Asegúrese de importarlo yendo a Sketch --> Add file, o simplemente copie y pegue el MP3 a la misma carpeta donde está el código
  
  // Cargar el audio con un búfer de 1024 muestras por segundo.
  // Cada muestra es un número que representa el nivel de amplitud de onda sonora en un instante específico dentro de una serie de tiempo.
  player = minim.loadFile("time.mp3", 1024);
  player.play(); // Reproducimos el audio

  // Configuramos FFT para transformar la señal de dominio de tiempo a dominio de frecuencia
  fft = new FFT(player.bufferSize(), player.sampleRate());
}

void draw() {
  // Aplicamos la transformada de Fourier para analizar las frecuencias del audio
  fft.forward(player.mix);

  // Obtenemos la amplitud de una banda de frecuencia específica (10ª banda en este caso)
  float level = fft.getBand(10);

  // Configuramos el color de la línea y el relleno del círculo
  stroke(color(random(0, 100), random(100, 255), random(200, 255)));
  fill(255, 5);

  // Ajustamos el radio del círculo en función de la amplitud de la banda de frecuencia
  rad = (level * (width / 7));

  // Dibujamos un círculo con los valores obtenidos
  ellipse(x, y, rad, rad);
  fill(random(255), 10);

  // Desplazamos la posición en el eje X para el siguiente dibujo
  x += 2;

  // Reiniciamos la posición cuando se alcanza el ancho de la pantalla
  if (x > width) {
    x = 0;
    y += 80;
  }

  // Reiniciamos la posición cuando se alcanza la altura de la pantalla y limpiamos el fondo
  if (y > height) {
    y = 0;
    //background(0);
  }
  
  // Mostrar en la consola todas las frequencias en la canción
  // Si el búfer tiene 1024 muestras, la FFT genera 512 bandas de frecuencia (1024 / 2 = 512).
  // Cada banda representa un rango de frecuencias del sonido.
  for (int i = 0; i < fft.specSize(); i++) {
    float frequency = (i + 0.5) * fft.getBandWidth();
    println("Banda " + i + ": " + frequency + " Hz, Amplitud: " + fft.getBand(i));
  }
}

// Método para liberar recursos cuando se detiene el programa
void stop() {
  player.close();
  minim.stop();
  super.stop();
}
