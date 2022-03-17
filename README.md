# isort Code Formatter GitHub Action

A GitHub action that runs [isort](https://github.com/timothycrosley/isort) for Python.

## Example Workflow

```yaml
name: Sort imports with isort

on:
  pull_request:
    branches: [master]
    types: [closed]

jobs:
  format:

    if: github.event.pull_request.merged == true
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
      
    - name: Run isort
      uses: olance/isort-action@v1.1.0
      with:
        args: .
      
    - name: Commit changes
      run: |
        git config --local user.email "action@github.com"
        git config --local user.name "GitHub Action"
        git add -A && git diff-index --cached --quiet HEAD || git commit -m 'isort'
      
    - name: Push changes
      uses: ad-m/github-push-action@v0.5.0
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
```

For a full list of possible `args` checkout the [isort docs](https://timothycrosley.github.io/isort/#using-isort).
