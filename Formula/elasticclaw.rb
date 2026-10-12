class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.10.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "30535dae10048a004b84ce965cfb97fd98a53f1c19749064a9dccda21cc78278"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "792f278da3343f76fba484f16f48ed49854bf9f8b62fc490e1966828f28c3d7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "de9f48b79b000dc0e6bd60bad310cc0e0896f5aed9b54ac45e0befc08935c0c2"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "d438429ad286bedee8b9341cb8be8d7df64e8d63267a3a06be8e2b213123d932"
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
