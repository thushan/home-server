# Ollama

Easiest is to opt for installing from the repository, it will also notify you of updates:

```bash
$ curl -fsSL https://ollama.com/install.sh | sh
```

Visit [ollama](https://github.com/ollama/ollama) for others.

## Scripts

Update all models easily:

## Linux / macOS

**NOTE:** You can configure how many to run concurrently with `PULL_THREADS`.

```bash
$ PULL_THREADS=4 ollama list | tail -n +2 | awk '{print $1}' | xargs -n 1 -P $PULL_THREADS ollama pull
```


Credit: [@finashkin|Ollama-issues](https://github.com/ollama/ollama/issues/1890#issuecomment-2136093357):

```bash
$ ollama list | awk 'NR>1 && !/reviewer/ {system("ollama pull "$1)}'
```


## Windows

Credit: [@finashkin|Ollama-issues](https://github.com/ollama/ollama/issues/1890#issuecomment-2136093357):

```powershell
ollama list | Select-Object -Skip 2 | ConvertFrom-String | % {Write-Host -BackgroundColor DarkRed 'updating' $_.p1 'model' ; ollama pull $_.p1}
```

