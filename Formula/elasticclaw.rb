class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "0.0.54"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-arm64"
      sha256 "a367eb5fc0041d6df5987e1aface4c6575df1db49416922e52a6aecafb0f65a9"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-amd64"
      sha256 "6d2e99adfd4e7a5545783986ad43efd8cd798be912ff858685ba404df6daf0db"
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
