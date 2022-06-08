<div align="center">

# asdf-quarkus [![Build](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/build.yml/badge.svg)](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/build.yml) [![Lint](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/lint.yml/badge.svg)](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/lint.yml) [![GitHub license](https://img.shields.io/github/license/marcwrobel/asdf-quarkus)](https://github.com/marcwrobel/asdf-quarkus/blob/master/LICENSE)

[Quarkus CLI](https://quarkus.io/guides/cli-tooling) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

## Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Implementation notes](#implementation-notes)
- [Contributing](#contributing)
- [License](#license)

## Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities,
- a JDK 11+ for Quarkus (you can install one using [asdf-java](https://github.com/halcyon/asdf-java)).

## Install

Plugin:

```shell
asdf plugin add quarkus https://github.com/marcwrobel/asdf-quarkus.git
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

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

## Implementation notes

This plugin downloads Quarkus CLI from [GitHub releases of the Quarkus project](https://github.com/quarkusio/quarkus/releases).

Quarkus CLI releases are found using the [Quarkus project's tags](https://github.com/quarkusio/quarkus/tags)
from version 2.6.2. Before this version Quarkus CLI did not exist or was not published on GitHub releases.

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/marcwrobel/asdf-quarkus/graphs/contributors)!

## License

See [LICENSE](LICENSE) © [Marc Wrobel](https://github.com/marcwrobel/)
