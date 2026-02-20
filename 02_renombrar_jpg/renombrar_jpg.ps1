# Obtener fecha en formato yyyyMMdd
$fecha = Get-Date
$prefijo = $fecha.ToString("yyyyMMdd")

# Buscar archivos JPG dentro de la carpeta pruebas
$archivos = Get-ChildItem -Path ".\pruebas" -Filter *.jpg

foreach ($archivo in $archivos) {

    $nuevoNombre = $prefijo + "-" + $archivo.Name

    Rename-Item -Path $archivo.FullName -NewName $nuevoNombre
}