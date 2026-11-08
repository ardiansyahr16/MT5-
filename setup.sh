#!/bin/bash
# Jalankan di macOS
set -e

# Xcode Command Line Tools
xcode-select --install 2>/dev/null || true

# Homebrew + tools
brew install ldid dpkg make

# Theos (gunakan fork yang kompatibel dengan Roothide)
export THEOS=~/theos
if [ ! -d "$THEOS" ]; then
  git clone --recursive https://github.com/theos/theos.git "$THEOS"
  # Untuk Roothide, gunakan Theos fork/branch dari dokumentasi Roothide
  # dan ikuti instruksi skema paket "roothide" di sana.
fi

# iOS SDK: ambil dari Xcode, atau gunakan sdks repo
if [ ! -d "$THEOS/sdks/iPhoneOS16.5.sdk" ]; then
  git clone https://github.com/theos/sdks.git /tmp/sdks
  cp -r /tmp/sdks/*.sdk "$THEOS/sdks/"
fi

echo 'export THEOS=~/theos' >> ~/.zshrc
echo 'export PATH=$THEOS/bin:$PATH' >> ~/.zshrc
echo "Setup selesai. Jalankan: source ~/.zshrc"
