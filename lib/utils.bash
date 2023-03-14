#!/usr/bin/env bash

set -euo pipefail

GH_REPO="quarkusio/quarkus"
TOOL_NAME="quarkus"
TOOL_TEST="quarkus --help"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

curl_opts=(-fsSL)

# https://docs.github.com/en/rest/overview/resources-in-the-rest-api#rate-limiting
if [ -n "${GITHUB_API_TOKEN-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_all_versions() {
  local url="https://api.github.com/repos/$GH_REPO/releases"
  local jq_filter='.[] | select (.prerelease == false) | select (any(.assets[].name; . | startswith("quarkus-cli"))) | .tag_name'
  curl "${curl_opts[@]}" "$url" | jq -r "$jq_filter" || fail "Could not fetch versions from $url"
}

download_release() {
  local version="$1"
  local filename="$2"
  local url="https://github.com/$GH_REPO/releases/download/${version}/$TOOL_NAME-cli-${version}.tar.gz"

  echo "* Downloading $TOOL_NAME release $version..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

download_checksum() {
  local version="$1"
  local filename="$2"
  local url="https://github.com/$GH_REPO/releases/download/${version}/checksums_sha256.txt"

  echo "* Downloading $TOOL_NAME release $version checksums..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

verify_checksum() {
  local checksums_filename="$1"
  (
    cd "$(dirname "$checksums_filename")"
    shasum -a 256 --check --ignore-missing --strict "$checksums_filename"
  )
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
