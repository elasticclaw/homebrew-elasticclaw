class ElasticclawBeta < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.10.19-beta.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "5046a247bd774fa930a477d456a491d162ef296b9120179b4df22deb3920afcd"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "fef4947f6a6378dd25d19e28967c81abd5a79dec539d3481802c8bca9856f6c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "61138e82a39a89af7a805c72d4b8b2fb2980c38b970aa586cd43c498527bc281"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "a5bc1bcaa102f1041e08615245442ffd648dfebec72698ac4fd215a3d0f39c95"
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
