# Procesador MIPS en Verilog
## Descripcion
Este proyecto consiste en la implementación de un procesador MIPS utilizando el lenguaje de descripción de hardware Verilog, y utilizado la herramienta de simulación ModelSim.
El procesador MIPS es una arquitectura de conjunto de instrucciones (ISA) comúnmente utilizada en aplicaciones incrustadas y académicas debido a su sencillez y eficiencia.

También va a contener un script de Python para transformar operaciones de assembly a binario, y estas serán insertadas a el procesador para que las procese. Estos tipos de instrucciones son de tipo R, I y J.

## Tabla de contenidos
- [Descripción](##Descripcion)
- [Funcionamiento](#Funcionamiento)
	- [Verilog](##Verilog)
		- [Operaciones](###Operaciones)


- [Creditos](#Creditos)

# Funcionamiento

## Verilog
En este programa puedes usar instrucciones de tipo R, este tipo de instrucciones operan principalmente con datos que dentro del registro; luego se decodifica para hacer las operaciones que esta les indica. 
Estas instrucciones son de tipo binario de 32 bits.

En este programa puedes usar instrucciones de tipo R y este las decodifica para hacer las operaciones que esta les indica. Estas instrucciones son de tipo binario de 32 bits.
Como funcionan las instrucciones:
| op  |rs   |  rt | rd | ramt | funct  |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
|6 bits| 5 bits| 5 bits| 5 bits| 5 bits| 6 bits|

- Los primeros 5 bits es el código de operación que se realizara
- rd, rs, y rt son registros de 5 bits cada uno. rs y rt son los operandos fuente, y rd es el registro de destino donde se almacenará el resultado.
- shamt (shift amount) es indica la cantidad de bits que se desplazarán en las operaciones de desplazamiento lógico) y desplazamiento aritmético a la izquierda se utilizan.
- funct son las instrucciones que va a realizar la ALU.

### Operaciones
#### Tipo R

|  Instrucción | Ensamblador  | Descripción  |
| ------------ | ------------ | ------------ | 
|  **AND** | and $rd, $rs, $rt   | Operación AND  |
|  **OR** |  or $rd, $rs, $rt | Operación OR  |
| **ADD** | add $rd, $rs, $rt  | Suma  |
| **SUB** | sub $rd, $rs, $rt  | Resta  |
|  **SLT** |  slt $rd, $rs, $rt | Establecer en menos de  |
| **NOR**  | nor $rd, $rs, $rt  | Operación NOR  |
| **XOR**  |  xor $rd, $rs, $rt |  Operación XOR |
| **SLL**  | sll $rd, $rs, $rt  |  Desplazamiento a la izquierda lógico |
| **SRL**  | srl $rd, $rs, $rt  |  Desplazamiento a la derecha  lógico  |
|**SRA**| sra $rd, $rs, $rt |  Desplazamiento a la izquierda aritmético  |

# Creditos
Este proyecto está siendo elaborado por:
- CHRISTOPHER ALCOCER CAMARENA
- ALAN GUADALUPE HERRERA CASTORENA
- MARICELA RAMOS CASILLAS
- FERRAN SANDI TREJO
