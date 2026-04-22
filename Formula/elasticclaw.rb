class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "0.0.22"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-arm64"
      sha256 "d2674c179e6fd3fdeb51308278ab2a53bc7c1c61cf894dc531b1a4da055ef287"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-amd64"
      sha256 "fc51c8a8bc11a05d39e27d596c3e07af27b795a27aa3366580336f2d1cfc0f15"
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
