class ElasticclawBeta < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.8.21-beta.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "84bf441617c2fee807e8575fc48493fd4c2995c7254b5405f0cd1c22fc7c6ad3"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "5e6fd80dacac555e77724bcc840a9215c35174ac6871569050c750f81c406f9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "0b5fa2ddb81c72d6b013ff6cca85cc5e54dba2c28eb7553b858a5ffb0ac261ad"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "544a3bfaf21f4ad040946462d98449853f93392f6629886c71f35dc39bd4bc3a"
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
