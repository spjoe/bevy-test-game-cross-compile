# This script takes care of testing your crate

set -ex

main() {
    cross build --target $TARGET --release
}