class ElasticclawBeta < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.8.25-beta.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "6c67a46452bdd9fd967fd07b15f9e73e91a1eaa84be618ad466aff1a296b62ad"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "b1ae2dc33fd8bc6095b85491c6d0962adeb5e2894ffe68af428bb1fc15519939"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "0661570e93dd5db5e356d8a43f0c39d5a3c0dc1dee0103fc4ccd49c88936b44a"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "b993eb521087de67be384b8d92cbcea38cf86c705a36afcd6cbad8251f81acd2"
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
