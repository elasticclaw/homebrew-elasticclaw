class Elasticclaw < Formula
  desc "Provision and manage AI agent claws from the command line"
  homepage "https://github.com/elasticclaw/elasticclaw"
  version "2026.9.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-arm64"
      sha256 "b6d2bc0e4baa5b5b8ed2a7563f9a74ba35cd63dd6886f8e693adb0f7ca4bbcb3"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-darwin-amd64"
      sha256 "e160b31653652af39527382887d374332d4a9d7a586c2d81fdc34d3e4c6afbbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-arm64"
      sha256 "3f7d695371cd2401af76f3e84293fef3456e8701bfddf0e7f7512c0221dd56a4"
    end
    on_intel do
      url "https://github.com/elasticclaw/elasticclaw/releases/download/#{version}/elasticclaw-linux-amd64"
      sha256 "e1b2b6277d132104b368ef31950ec33956d54a3534346aa01ec8c95be5b8faf5"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "elasticclaw-#{os}-#{arch}" => "elasticclaw"
  end

  test do
    assert_match "elasticclaw", shell_output("#{bin}/elasticclaw version 2>&1")
  end
end
