<div align="center">

# asdf-quarkus [![Build](https://github.com/asdf-community/asdf-quarkus/actions/workflows/build.yml/badge.svg)](https://github.com/asdf-community/asdf-quarkus/actions/workflows/build.yml) [![Lint](https://github.com/asdf-community/asdf-quarkus/actions/workflows/lint.yml/badge.svg)](https://github.com/asdf-community/asdf-quarkus/actions/workflows/lint.yml) [![GitHub license](https://img.shields.io/github/license/asdf-community/asdf-quarkus)](https://github.com/asdf-community/asdf-quarkus/blob/master/LICENSE)

[Quarkus CLI](https://quarkus.io/guides/cli-tooling) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

## Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Completion](#completion)
- [Notes](#notes)
- [Contributing](#contributing)
- [License](#license)

## Dependencies

Install dependencies :
- `bash`, `curl`, `tar`: generic POSIX utilities,
- [`jq`](https://stedolan.github.io/jq/) : a lightweight and flexible command-line JSON processor.

Quarkus dependencies :
- JDK 11 (or greater) : you can install one using [asdf-java](https://github.com/halcyon/asdf-java).

## Install

Plugin:

```shell
asdf plugin add quarkus
# or
asdf plugin add quarkus https://github.com/asdf-community/asdf-quarkus.git
```

quarkus:

```shell
# Show all installable versions
asdf list-all quarkus

# Install specific version
asdf install quarkus latest

# Set a version globally (on your ~/.tool-versions file)
asdf global quarkus latest

# Now quarkus commands are available
quarkus --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to install & manage versions.

## Completion

Quarkus command completion is not managed by this plugin. Check the [Quarkus CLI documentation](https://quarkus.io/guides/cli-tooling#shell-autocomplete-and-aliases) for instructions on how to configure it.

## Notes

This plugin downloads Quarkus CLI from [GitHub releases of the Quarkus project](https://github.com/quarkusio/quarkus/releases) and only releases containing a Quarkus CLI `tar.gz` file are considered.

This plugin uses the GitHub API to retrieve Quarkus CLI releases. If you reach the limit you may consider declaring a `GITHUB_API_TOKEN` environment variables [with a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) to increase it. Take a look at [the GitHub documentation](https://docs.github.com/en/rest/overview/resources-in-the-rest-api#rate-limiting) for more information about GitHub API rate limiting.

Quarkus CLI releases are meant to be backward compatible. [You are encouraged to always use the latest release](https://groups.google.com/g/quarkus-dev/c/R_CZ7My4Rxc/m/WuxnSTjGBQAJ).

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

## License

Licensed under the [MIT License](/LICENSE).
