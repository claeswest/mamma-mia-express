# Makes smaller copies of the close-ups for publishing (the originals in closeups/ are left alone).
# Usage: powershell -File shrink.ps1 <output folder>
param([Parameter(Mandatory = $true)][string]$Out, [int]$Width = 1440, [long]$Quality = 80)
Add-Type -AssemblyName System.Drawing
New-Item -ItemType Directory -Force $Out | Out-Null
$codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$params = New-Object System.Drawing.Imaging.EncoderParameters 1
$params.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality), $Quality
Get-ChildItem (Join-Path $PSScriptRoot 'closeups') -Filter *.jpg | ForEach-Object {
  $src = [System.Drawing.Image]::FromFile($_.FullName)
  $h = [int]($src.Height * $Width / $src.Width)
  $bmp = New-Object System.Drawing.Bitmap $Width, $h
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.DrawImage($src, 0, 0, $Width, $h)
  $bmp.Save((Join-Path $Out $_.Name), $codec, $params)
  $g.Dispose(); $bmp.Dispose(); $src.Dispose()
}
