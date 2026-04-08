
    param(
        [string]$key
    )

    $fileContent = Get-Content ".\god.txt" -Raw
    $fileContent = $fileContent.Trim()
    try {
        $decodedCommand = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($fileContent))
        
        # If key provided, set environment variable for the decoded script
        if ($key) {
            $env:NARASHIMA_KEY = $key
        }
        
        Invoke-Expression $decodedCommand
    } catch {
        Write-Host "Error decoding Base64: $_"
    }
    