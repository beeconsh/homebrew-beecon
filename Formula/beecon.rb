class Beecon < Formula
  desc "Infrastructure language your agent uses to deploy to the cloud"
  homepage "https://github.com/beeconsh/cli"
  license "MIT"

  # Updated automatically by release workflow
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "beecon"
  end

  test do
    assert_match "beecon", shell_output("#{bin}/beecon 2>&1", 1)
  end
end
