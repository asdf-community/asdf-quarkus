<div align="center">

# asdf-quarkus [![Build](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/build.yml/badge.svg)](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/build.yml) [![Lint](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/lint.yml/badge.svg)](https://github.com/marcwrobel/asdf-quarkus/actions/workflows/lint.yml)


[quarkus](https://quarkus.io/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add quarkus
# or
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

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/marcwrobel/asdf-quarkus/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Marc Wrobel](https://github.com/marcwrobel/)
