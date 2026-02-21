# Script: discos_bajo_porcentaje.ps1

# 1️⃣ Recibir parámetro
$limite = [int]$args[0]

# 2️⃣ Obtener discos físicos (DriveType=3)
$discos = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

# 3️⃣ Recorrer discos
foreach ($disco in $discos) {

    # Calcular porcentaje libre
    $porcentajeLibre = ($disco.FreeSpace / $disco.Size) * 100

    # 4️⃣ Comparar con límite
    if ($porcentajeLibre -lt $limite) {

        # Convertir bytes a GB sin decimales
        $libreGB = [int]($disco.FreeSpace / 1GB)
        $totalGB = [int]($disco.Size / 1GB)

        # 5️⃣ Mostrar resultado
        Write-Host "Unidad: $($disco.DeviceID) - Libre: $libreGB GB - Total: $totalGB GB"
    }
}