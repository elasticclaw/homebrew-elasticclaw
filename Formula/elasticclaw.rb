class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.10.28"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "e2cdbe6440dbc5c8e2d0b555bb8581dfdd35832fede533dbb3fe01faf6699fcb"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "5d29ce77b6da5c243c2385cafb19df3a0684cff853d7e7efacffae368b486f57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "8ae7ae2fa860d964ccd75be5a593917bcf90ea31e9ecc38bcacb879fec279df8"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "2fde124de252cd094b53b90fe0acec4f660a12e44de66bc166dd7fbc781ee136"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "elasticclaw-#{os}-#{arch}" => "elasticclaw"
  end

  test do
    assert_match "elasticclaw", shell_output("#{bin}/elasticclaw version 2>&1")
  end
end
