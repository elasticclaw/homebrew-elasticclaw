class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "0.0.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-arm64"
      sha256 "0c9bbc43162eb3aea9647df8cf672c37464f7b6cfe08100c4ff675f81f224f16"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-amd64"
      sha256 "3e5b9f7457be4d14568ca9293f9059dfb7518260e3d31444a99089525a7920a6"
    end
  end

  def install
    bin_name = Hardware::CPU.arm? ? "elasticclaw-darwin-arm64" : "elasticclaw-darwin-amd64"
    bin.install bin_name => "elasticclaw"
  end

  test do
    assert_match "elasticclaw", shell_output("#{bin}/elasticclaw version 2>&1")
  end
end
