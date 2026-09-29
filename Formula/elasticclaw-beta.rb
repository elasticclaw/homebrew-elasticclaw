class ElasticclawBeta < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.9.29-beta.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "fb72f9b50108b473a0add71e5f5738a1578f5f546814f3407deef7123a8c1a92"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "811dec904e8571095050f9bf1a8ecf7815ba7def0ee17d36d3ff90cbdac1db69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "239643cd5da311a0bd1e60fb0c8b6e956e613b6dab25e32661546820e1290084"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "5eb41b8382b3050ce9532f9bb0d5f905e72c10ef42b3fb2c1bdc8bc1edc9c3d4"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "elasticclaw-#{os}-#{arch}" => "elasticclaw-beta"
  end

  test do
    assert_match "elasticclaw", shell_output("#{bin}/elasticclaw-beta version 2>&1")
  end
end
