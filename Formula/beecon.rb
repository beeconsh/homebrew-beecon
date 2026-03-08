class Beecon < Formula
  desc "Agent-driven infrastructure-as-code language for cloud deployments"
  homepage "https://github.com/beeconsh/cli"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Version and SHA256 values are updated automatically by .github/workflows/update-formula.yml
  version "0.1.0"

  # Release artifacts must follow this naming convention:
  #   beecon_{os}_{arch}.tar.gz (e.g., beecon_darwin_arm64.tar.gz)
  # Tags must use v-prefix semver (e.g., v0.1.0)
  # Each tarball must contain a single binary named "beecon" at the root
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_darwin_arm64.tar.gz"
      sha256 "48a5e72c3ab0215ea914990e7df72b47016780639a47469ba76bf7a6feccbb15"
    else
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_darwin_amd64.tar.gz"
      sha256 "5dd70282ddd753b8fba0a3cba36f9ade86f1bc40b224707fd1886c4f9f15ebd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_linux_arm64.tar.gz"
      sha256 "9324421603daa99064d2e7c09e255da3e46f299c13f249ea13d02e2fcf982d96"
    else
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_linux_amd64.tar.gz"
      sha256 "5498e2e2ca246c8ecf0df318da08ea30c3407c736cb5ce2ffbdea361a50b6f79"
    end
  end

  def install
    bin.install "beecon"

    generate_completions_from_executable(bin/"beecon", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beecon --version")
  end
end
