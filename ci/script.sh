# This script takes care of testing your crate

set -ex

# TODO This is the "test phase", tweak it as you see fit
main() {
    /root/.cargo/bin/cross build --target $TARGET
    /root/.cargo/bin/cross build --target $TARGET --release

    if [ ! -z $DISABLE_TESTS ]; then
        return
    fi

    /root/.cargo/bin/cross test --target $TARGET
    /root/.cargo/bin/cross test --target $TARGET --release
}

# we don't run the "test phase" when doing deploys
if [ -z $TRAVIS_TAG ]; then
    main
fi
