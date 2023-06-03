param (
    [Parameter(Mandatory = $true)]
    [string]$usuario
)

# Comprobar que se recibe un único parámetro
if ($PSBoundParameters.Count -ne 1) {
    Write-Host "Debe proporcionar un nombre." -ForegroundColor Red
    exit
}

# Comprobar que el parámetro es tu nombre de usuario
if ($usuario -ne "ruben") {
    Write-Host "El nombre de usuario proporcionado no es válido." -ForegroundColor Red
    exit
}

function MostrarMenu {
    Clear-Host
    Write-Host "=== Menú ==="
    Write-Host "1. Crear carpeta"
    Write-Host "2. Borrar carpeta"
    Write-Host "3. Añadir texto a un archivo"
    Write-Host "4. Vaciar archivo info.txt"
    Write-Host "5. Salir"
    Write-Host ""
}

function SalirDelMenu {
    $respuesta = Read-Host "¿De verdad quieres salir? (sí/no)"
    if ($respuesta -eq "si") {
        exit
    }
}

while ($true) {
    MostrarMenu
    $opcion = Read-Host "Pon una opción"

    switch ($opcion) {
        1 {
            # Crear carpeta
            $ruta = Read-Host "Ingrese la ruta o el nombre de la carpeta que quieres crear"
            New-Item -ItemType Directory -Path $ruta
            Write-Host "La carpeta ha sido creada: $ruta"
        }
        2 {
            # Borrar carpeta
            $ruta = Read-Host "Ingrese la ruta o el nombre de la carpeta que quieres borrar"
            Remove-Item -Path $ruta -Recurse -Force
            Write-Host "La carpeta ha sido borrada: $ruta"
        }
        3 {
            # Añadir texto a un archivo
            $nombre = Read-Host "Ingrese su nombre"
            $apellido = Read-Host "Ingrese su primer apellido"
            $ciclo = Read-Host "Ingrese su ciclo"
            $contenido = "$nombre;$apellido;$ciclo"
            Add-Content -Path "info.txt" -Value $contenido
            Write-Host "Texto agregado al archivo info.txt"
        }
        4 {
            # Vaciar archivo info.txt
            Clear-Content -Path "info.txt"
            Write-Host "Archivo info.txt vaciado"
        }
        5 {
            # Salir
            SalirDelMenu
        }
        default {
            Write-Host "Opción inválida" -ForegroundColor Red
        }
    }
}
