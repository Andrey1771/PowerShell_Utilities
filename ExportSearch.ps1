# Путь до папки где будет происходить поиск
$path =  "C:\LAST_FIX_SHARED_LIB\VisiologyDesigner\libs\dashboards\data-access-viewer-integration\src\lib"
# Путь до файла, в который запишутся изменения
$pathToInput = "C:\LAST_FIX_SHARED_LIB\VisiologyDesigner\libs\dashboards\data-access-viewer-integration\src\index.ts"
# Паттерн поиска
$patternOfSearch = "export{1}[A-Za-z0-9-_ ]+"


# Содержимое папки, в которую будет производиться запись
$data = (Get-Content -Encoding UTF8 -Path $pathToInput -raw)

foreach ($file in $infolder)
{
    $result = Select-String $file -Pattern $patternOfSearch -Include "*.ts"

    foreach ($textLine in $result)
    {
        $data += "`n" + $textLine.Line
    }
}

# Устанавливаем новое значение содержимого файла записи
Set-Content -Path $pathToInput -Value $data  