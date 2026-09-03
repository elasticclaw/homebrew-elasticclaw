class ElasticclawBeta < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.9.3-beta.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "20a3678175bcfe0af3722a3981f3f5f2a7a438fc28db11572df3eb5ffbdd3b72"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "d63afb4dac7aceb3db401fa211a5362d5a399936486098e5833d373710504cf2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "4317541a4d43a12b957619e053962475fe23121f4dc05d62c8d9a8256993ecb7"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "53b5d2c920b43708eec37b942384719ade3d29866efa136aa3388467beb8f835"
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
