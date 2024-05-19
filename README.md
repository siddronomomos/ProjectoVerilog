# Procesador MIPS en Verilog

## Descripcion

Este proyecto consiste en la implementación de un procesador MIPS utilizando el lenguaje de descripción de hardware Verilog, y utilizado la herramienta de simulación ModelSim.
El procesador MIPS es una arquitectura de conjunto de instrucciones (ISA) comúnmente utilizada en aplicaciones incrustadas y académicas debido a su sencillez y eficiencia.

También va a contener un script de Python para transformar operaciones de assembly a binario, y estas serán insertadas a el procesador para que las procese. Estos tipos de instrucciones son de tipo R, I y J.

## Tabla de contenidos

- [Descripción](##Descripcion)
- [Funcionamiento](#Funcionamiento)

- [Creditos](#Creditos)

# Funcionamiento

## Verilog

En este programa puedes usar instrucciones de tipo R, este tipo de instrucciones operan principalmente con datos que dentro del registro; luego se decodifica para hacer las operaciones que esta les indica.
Estas instrucciones son de tipo binario de 32 bits.

En este programa puedes usar instrucciones de tipo R y este las decodifica para hacer las operaciones que esta les indica. Estas instrucciones son de tipo binario de 32 bits.
Como funcionan las instrucciones:
| op |rs | rt | rd | ramt | funct |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
|6 bits| 5 bits| 5 bits| 5 bits| 5 bits| 6 bits|

- Los primeros 5 bits es el código de operación que se realizara
- rd, rs, y rt son registros de 5 bits cada uno. rs y rt son los operandos fuente, y rd es el registro de destino donde se almacenará el resultado.
- shamt (shift amount) es indica la cantidad de bits que se desplazarán en las operaciones de desplazamiento lógico) y desplazamiento aritmético a la izquierda se utilizan.
- funct son las instrucciones que va a realizar la ALU.

### Operaciones

#### Tipo R

| Instrucción | Ensamblador        | Descripción                              |
| ----------- | ------------------ | ---------------------------------------- |
| **AND**     | and $rd, $rs, $rt  | Operación AND                            |
| **OR**      | or $rd, $rs, $rt   | Operación OR                             |
| **ADD**     | add $rd, $rs, $rt  | Suma                                     |
| **SUB**     | sub $rd, $rs, $rt  | Resta                                    |
| **SLT**     | slt $rd, $rs, $rt  | Establecer en menos de                   |
| **NOR**     | nor $rd, $rs, $rt  | Operación NOR                            |
| **XOR**     | xor $rd, $rs, $rt  | Operación XOR                            |
| **SLL**     | sll $rd, $rs, $rt  | Desplazamiento a la izquierda lógico     |
| **SRL**     | srl $rd, $rs, $rt  | Desplazamiento a la derecha lógico       |
| **SRA**     | sra $rd, $rs, $rt  | Desplazamiento a la izquierda aritmético |
| **ADDI**    | addi $rd, $rs, inm | Suma inmediata                           |
| **ANDI**    | andi $rd, $rs, inm | Operación AND inmediata                  |
| **ORI**     | ori $rd, $rs, inm  | Operación OR inmediata                   |
| **SLTI**    | slti $rd, $rs, inm | Establecer en menos de inmediato         |
| **BEQ**     | beq $rs, $rt, inm  | Salto si son iguales                     |
| **J**       | j inm              | Salto incondicional                      |
| **NOP**     | nop                | No operación                             |
| **LW**      | lw $rd, inm($rs)   | Cargar palabra                           |
| **SW**      | sw $rd, inm($rs)   | Almacenar palabra                        |

## Python

# Guía de Usuario para el Decodificador de Instrucciones MIPS en Python

Este documento proporciona una guía paso a paso sobre cómo utilizar el programa de decodificación de instrucciones MIPS desarrollado en Python. El programa permite a los usuarios decodificar instrucciones MIPS escritas en un archivo de texto y convertirlas a su representación binaria.

## Requisitos Previos

Asegúrate de tener instalados los siguientes componentes en tu sistema:

- Python 3.x
- Tkinter (generalmente incluido con Python)

## Estructura del Programa

El programa está dividido en varias funciones principales:

- **decodificar_instruccion**: Decodifica una única instrucción MIPS y la convierte a binario.
- **decodificar_archivo**: Decodifica todas las instrucciones de un archivo y guarda las instrucciones binarias en otro archivo.
- **editar_archivo**: Abre una ventana para editar el contenido del archivo de entrada.
- **guardar_y_compilar**: Guarda el contenido editado y ejecuta la decodificación.
- **seleccionar_archivo**: Permite al usuario seleccionar un archivo a través de una ventana de diálogo.

## Instrucciones de Uso

### 1. Ejecución del Programa

1. Guarda el script Python en un archivo con extensión `.py`, por ejemplo, `decodificador_mips.py`.
2. Ejecuta el script desde la línea de comandos o desde un entorno de desarrollo (IDE):

   ```bash
   python decodificador_mips.py
   ```

### 2. Seleccionar y Editar un Archivo

1. Al ejecutar el programa, se abrirá una ventana principal de Tkinter titulada "Decodificador Python".
2. Haz clic en el botón "Seleccionar Archivo a Editar y Compilar".
3. Se abrirá una ventana de diálogo para seleccionar un archivo. Navega hasta el archivo de texto que contiene las instrucciones MIPS y selecciónalo.

### 3. Edición del Archivo

1. Después de seleccionar el archivo, se abrirá una ventana de edición con el contenido del archivo de texto.
2. Realiza cualquier modificación necesaria en las instrucciones MIPS directamente en la ventana de edición.
3. Una vez que hayas terminado de editar, haz clic en el botón "Guardar y Compilar" para guardar los cambios y comenzar el proceso de decodificación.

### 4. Decodificación y Guardado

1. El programa decodificará cada instrucción en el archivo y convertirá las instrucciones a su forma binaria.
2. Las instrucciones decodificadas se guardarán en la misma ubicación que el archivo original.
3. Se mostrará un mensaje de éxito indicando que el archivo se ha decodificado y guardado correctamente.

## Formato de las Instrucciones

El programa soporta una variedad de instrucciones MIPS de tipo R e I. Asegúrate de que las instrucciones en el archivo de texto sigan el formato adecuado:

### Ejemplo de Instrucción de Tipo R

```
add $1, $2, $3
```

### Ejemplo de Instrucción de Tipo I

```
addi $1, $2, 10
```

### Limitaciones

- Las instrucciones deben estar separadas por líneas.
- Actualmente, el programa no soporta instrucciones tipo J o pseudoinstrucciones.

## Manejo de Errores

Si el programa encuentra un error durante la decodificación (por ejemplo, una instrucción no válida), mostrará un mensaje de error. Asegúrate de que todas las instrucciones en el archivo sean válidas y sigan el formato correcto.

# Creditos

Este proyecto está siendo elaborado por:

- CHRISTOPHER ALCOCER CAMARENA
- ALAN GUADALUPE HERRERA CASTORENA
- MARICELA RAMOS CASILLAS
- FERRAN SANDI TREJO
