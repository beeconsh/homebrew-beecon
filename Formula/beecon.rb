class Beecon < Formula
  desc "Agent-driven infrastructure-as-code language for cloud deployments"
  homepage "https://github.com/beeconsh/cli"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Version and SHA256 values are updated automatically by .github/workflows/update-formula.yml
  version "0.2.0"

  # Release artifacts must follow this naming convention:
  #   beecon_{os}_{arch}.tar.gz (e.g., beecon_darwin_arm64.tar.gz)
  # Tags must use v-prefix semver (e.g., v0.1.0)
  # Each tarball must contain a single binary named "beecon" at the root
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_darwin_arm64.tar.gz"
      sha256 "a49c60d47629bba5ca8a42de86c99f722d165647aef1f8b0451b9f754988cc16"
    else
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_darwin_amd64.tar.gz"
      sha256 "cb459b26a1efd7668c2a58c34a2fa40b212e9913fbbb98143978741579852412"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_linux_arm64.tar.gz"
      sha256 "409a6d65436f3a69899feb6edaf62ca7819be385542c3a8d4b58f09c4d1f702f"
    else
      url "https://github.com/beeconsh/cli/releases/download/v#{version}/beecon_linux_amd64.tar.gz"
      sha256 "2fdfda25227e41a8d84cef7a872778b46678a275d40393cf34e1df1f6988e2b0"
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
