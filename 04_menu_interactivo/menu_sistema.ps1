Clear-Host

$salir = $false

while (-not $salir) {

    Write-Host "===== MENU DEL SISTEMA =====" -ForegroundColor Cyan
    Write-Host "1. Listar servicios arrancados"
    Write-Host "2. Mostrar fecha del sistema"
    Write-Host "3. Abrir Bloc de notas"
    Write-Host "4. Abrir Calculadora"
    Write-Host "5. Salir"
    Write-Host ""

    $opcion = Read-Host "Seleccione una opcion (1-5)"

    switch ($opcion) {

        "1" {
            Write-Host "`nServicios arrancados:`n" -ForegroundColor Yellow
            Get-Service | Where-Object { $_.Status -eq "Running" } | 
                Sort-Object DisplayName | 
                Format-Table Name, Status -AutoSize
            Read-Host "`nPulse Enter para continuar"
            Clear-Host
        }
        "2" {
            Clear-Host
            Write-Host "===== FECHA DEL SISTEMA =====" -ForegroundColor Cyan
            Write-Host ""
            Get-Date | Format-List
            Write-Host ""
            Read-Host "Pulse Enter para volver al menu"
            }
       

        "3" {
            Write-Host "`nAbriendo Bloc de notas..." -ForegroundColor Green
            Start-Process notepad.exe
        }

        "4" {
            Write-Host "`nAbriendo Calculadora..." -ForegroundColor Green
            Start-Process calc.exe
        }

        "5" {
            Write-Host "`nSaliendo del programa..."
            $salir = $true
        }

        default {
            Write-Host "`nOpcion no valida" -ForegroundColor Red
            Read-Host "Pulse Enter para continuar"
            Clear-Host
        }
    }
}