class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "0.0.39"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-arm64"
      sha256 "3296c458f655bac43374281bc3ae126f8e032ef8f3d6daa035a7f3ca8452b8e5"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-amd64"
      sha256 "90c2f4f244d429f8ea8bdd8d94c8c22e556d0bfeb48c6a46c63e1b06dd212ef8"
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
