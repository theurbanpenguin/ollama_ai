
$question = Read-Host "Ask AI a question"

$body = @{
    model = "gemma-uk"
    prompt = $question
    stream = $false
} | ConvertTo-Json

$result = Invoke-RestMethod `
    -Uri "http://localhost:11434/api/generate" `
    -Method Post `
    -Body $body `
    -ContentType "application/json"

Write-Host "`nAI Answer: $($result.response)"
