# ========================================
# Script: listar_mayores_1kb.ps1
# Autor: TuNombre
# Descripción: Lista los ficheros del directorio actual
#              que ocupen más de 1024 bytes.
# ========================================

Get-ChildItem -File |
Where-Object { $_.Length -gt 1024 }