import os
import tkinter as tk
from tkinter import filedialog, messagebox

# Definición de las operaciones y sus códigos de operación y función
operaciones = {
    "and": {"opcode": "000000", "funct": "100100"},
    "or": {"opcode": "000000", "funct": "100101"},
    "add": {"opcode": "000000", "funct": "100000"},
    "sub": {"opcode": "000000", "funct": "100010"},
    "slt": {"opcode": "000000", "funct": "101010"},
    "nor": {"opcode": "000000", "funct": "100111"},
    "xor": {"opcode": "000000", "funct": "100110"},
    "sll": {"opcode": "000000", "funct": "000000"},
    "srl": {"opcode": "000000", "funct": "000010"},
    "sra": {"opcode": "000000", "funct": "000011"}
}

# Función para decodificar una instrucción y convertirla a binario
def decodificar_instruccion(instruccion):
    partes = instruccion.split()
    operacion = partes[0].lower()
    if operacion not in operaciones:
        return "Instrucción no válida"

    rs = partes[1][1:]  # Eliminar el símbolo '$'
    rt = partes[2][1:]
    rd = partes[3][1:]

    # Obtener el código de operación y la función
    opcode = operaciones[operacion]["opcode"]
    funct = operaciones[operacion]["funct"]

    # Convertir los registros a binario de 5 bits
    rs_bin = bin(int(rs))[2:].zfill(5)
    rt_bin = bin(int(rt))[2:].zfill(5)
    rd_bin = bin(int(rd))[2:].zfill(5)
    shampt_bin = "00000"  # Valor fijo para shampt en instrucciones tipo R

    # Formar la instrucción en binario
    instruccion_bin = f"{opcode}{rs_bin}{rt_bin}{rd_bin}{shampt_bin}{funct}"

    return instruccion_bin

# Función para decodificar un archivo completo de instrucciones
def decodificar_archivo(archivo_entrada, archivo_salida):
    try:
        with open(archivo_entrada, 'r') as entrada:
            with open(archivo_salida, 'w') as salida:
                print("Instrucciones a decodificar: \n")
                for linea in entrada:
                    instruccion_bin = decodificar_instruccion(linea.strip())
                    salida.write(instruccion_bin + '\n')
                    print(instruccion_bin + " \n")

        messagebox.showinfo("Decodificación Exitosa", f"Archivo decodificado y guardado en {archivo_salida}")
    except Exception as e:
        messagebox.showerror("Error", f"Error al decodificar el archivo: {e}")

# Función para seleccionar un archivo y ejecutar la decodificación
def seleccionar_archivo():
    archivo_entrada = filedialog.askopenfilename()
    if archivo_entrada:
        # Obtener el directorio actual del script
        directorio_actual = os.path.dirname(os.path.realpath(__file__))
        archivo_salida = os.path.join(directorio_actual, "Resultado.txt")
        decodificar_archivo(archivo_entrada, archivo_salida)

def agregar_instruccion():
    archivo_entrada = filedialog.askopenfilename()
    if archivo_entrada:
        # Obtener el directorio actual del script
        directorio_actual = os.path.dirname(os.path.realpath(__file__))
        archivo_salida = os.path.join(directorio_actual, "Resultado.txt")
    try:
        with open(archivo_entrada, 'a') as entrada:
            for i in range(1):
                instruccion_asmr=input("Escribe la instruccion en ASMR: ")
                entrada.write(instruccion_asmr + "\n")
                entrada.close()
            
        decodificar_archivo(archivo_entrada, archivo_salida)
    except Exception as e:
        messagebox.showerror("Error", f"Error al escribir en archivo: {e}")

    

# Interfaz de usuario con Tkinter
root = tk.Tk()
root.title("Decodificador Python")
root.geometry("300x150")

boton_seleccionar_archivo = tk.Button(root, text="Seleccionar Archivo a Decodificar", command=seleccionar_archivo)
boton_seleccionar_archivo.pack()
boton_escribir_instrucciones = tk.Button(root, text="Agregar Instruccion ASMR", command=agregar_instruccion)
boton_escribir_instrucciones.pack()


root.mainloop()

