import os
import tkinter as tk
from tkinter import filedialog, messagebox, Text

# Definición de las operaciones y sus códigos de operación y función
operaciones = {
    # Tipo R 
    "sll": {"opcode": "000000", "funct": "000000"},  # shamt se especifica en la instrucción
    "srl": {"opcode": "000000", "funct": "000010"},  # shamt se especifica en la instrucción
    "sra": {"opcode": "000000", "funct": "000011"},  # shamt se especifica en la instrucción

    # Tipo R
    "and": {"opcode": "000000", "funct": "100100", "shamt": "00000"},
    "or": {"opcode": "000000", "funct": "100101", "shamt": "00000"},
    "add": {"opcode": "000000", "funct": "100000", "shamt": "00000"},
    "sub": {"opcode": "000000", "funct": "100010", "shamt": "00000"},
    "slt": {"opcode": "000000", "funct": "101010", "shamt": "00000"},
    "nor": {"opcode": "000000", "funct": "100111", "shamt": "00000"},
    "xor": {"opcode": "000000", "funct": "100110", "shamt": "00000"},

    # Tipo I
    "addi": {"opcode": "001000"},  
    "andi": {"opcode": "001100"},  
    "ori": {"opcode": "001101"},   
    "xori": {"opcode": "001110"},  
    "lui": {"opcode": "001111"},   
    "lw": {"opcode": "100011"},   
    "sw": {"opcode": "101011"},  
    "beq": {"opcode": "000100"},  
    "bne": {"opcode": "000101"},   
    "slti": {"opcode": "001010"},
    
    # Tipo J
    "j": {"opcode": "000010"},
    "jal": {"opcode": "000011"}
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

# Función para abrir una ventana para editar el archivo
def editar_archivo(archivo_entrada):
    editor = tk.Tk()
    editor.title("Editor de Archivo")
    
    with open(archivo_entrada, 'r') as archivo:
        contenido = archivo.read()

    text = Text(editor)
    text.insert(tk.END, contenido)
    text.pack()

    guardar_button = tk.Button(editor, text="Guardar y Compilar", command=lambda: guardar_y_compilar(archivo_entrada, text.get("1.0", tk.END)))
    guardar_button.pack()

    editor.mainloop()

# Función para guardar el contenido editado y compilar
def guardar_y_compilar(archivo_entrada, contenido):
    archivo_salida = archivo_entrada  # Puedes cambiar el nombre del archivo de salida si es necesario
    with open(archivo_entrada, 'w') as archivo:
        archivo.write(contenido)
    decodificar_archivo(archivo_entrada, archivo_salida)

# Función para seleccionar un archivo y ejecutar la decodificación
def seleccionar_archivo():
    archivo_entrada = filedialog.askopenfilename()
    if archivo_entrada:
        editar_archivo(archivo_entrada)

# Interfaz de usuario con Tkinter
root = tk.Tk()
root.title("Decodificador Python")
root.geometry("300x150")

boton_seleccionar_archivo = tk.Button(root, text="Seleccionar Archivo a Editar y Compilar", command=seleccionar_archivo)
boton_seleccionar_archivo.pack()

root.mainloop()
