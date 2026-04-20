class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "0.0.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-arm64"
      sha256 "adaaba57ea496a0f45e35732aec057efce771825055f6839b28cca5bde341d8e"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/v#{version}/elasticclaw-darwin-amd64"
      sha256 "abdce6882018654a7cd2d38bad155357ea10694abfa83b13c18a59d336d7d6ea"
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
