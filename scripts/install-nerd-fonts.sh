#/usr/bin/env bash

TARGET=/tmp/fonts

# Sparse clone is needed because repo is too big
echo "\n# Sparsing clone the repo because it's too big\n"
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git $TARGET

pushd $TARGET
echo "\n# Sparsing checkout the required fonts\n"
git sparse-checkout add patched-fonts/Noto

echo "\n# Installing fonts\n"
./install.sh Noto

popd
rm -rf $TARGET

echo "\n# Install successful!"
