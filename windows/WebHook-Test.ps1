$trigger = 1

if ($trigger -eq 1)
{
    $httpBody = @{"event_type"="upgrade_traefik"} | ConvertTo-Json

    $null = Invoke-WebRequest -Uri 'https://api.github.com/repos/gregoryca/traefik/dispatches' -Method Post -Body $httpBody -Headers @{'Accept' = 'application/vnd.github.everest-preview+json'; 'Authorization' = 'Bearer '} -ContentType "application/json"
}
