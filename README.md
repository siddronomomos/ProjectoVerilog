# Procesador MIPS en Verilog
## Descripcion
Este proyecto consiste en la implementación de un procesador MIPS utilizando el lenguaje de descripción de hardware Verilog, y utilizado la herramienta de simulación ModelSim.
El procesador MIPS es una arquitectura de conjunto de instrucciones (ISA) comúnmente utilizada en aplicaciones incrustadas y académicas debido a su sencillez y eficiencia.

También va a contener un script de Python para transformar operaciones de assembly a binario, y estas serán insertadas a el procesador para que las procese. Estos tipos de instrucciones son de tipo R, I y J.

## Tabla de contenidos
- [Descripción](##Descripcion)
- [Operaciones](#Operaciónes)
	- [Tipo R](##Tipo-R)


- [Creditos](#Creditos)

# Operaciónes
## Tipo R

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
