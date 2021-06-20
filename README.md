# GitHub Action: Run PHPCS with ReviewDog
This action runs [PHP Codesniffer](https://github.com/squizlabs/PHP_CodeSniffer) with [ReviewDog](https://github.com/reviewdog/reviewdog).

## Inputs
### `github_token`
**Required** Must be in form of `github_token: ${{ secrets.github_token }}`

### `level`
Report level for reviewdog [info,warning,error]. It's same as `-level` flag of reviewdog.
**Default** `warning`

### `reporter`
Reporter of reviewdog command [github-pr-check,github-check,github-pr-review]. It's same as `-reporter` flag of reviewdog.
**Default** `github-pr-check`

### `standard`
Can be any one or more of (in a comma-separated list without spaces):
- `MySource`
- `PEAR`
- `PSR1`
- `PSR12`
- `PSR2`
- `Squiz`
- `Zend`
or a custom rules configuration file path.
**Default** `PSR1,PSR2,PSR12`

### `target_directory`
**Default** `src`

## Usage
```yml
# name: Laravel Package Tests

# on:
#   push:
#     branches: [ master, develop ]
#   pull_request:
#     branches: [ master, develop ]

# jobs:
  phpcs-linter:
    name: PHPCS
    runs-on: ubuntu-latest
    steps:
        - name: Check out code into the workspace
            uses: actions/checkout@v2
        - name: Check code with reviewdog
            uses: GeneaLabs/action-reviewdog-phpcs@1.0.0
            with:
                github_token: '${{ secret.GITHUB_TOKEN }}'
                level: 'warning'
                reporter: 'github-pr-check'
                standard: 'PSR1,PSR2,PSR12'
                target_directory: 'src'
```
