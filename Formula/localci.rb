class Localci < Formula
  desc "Local post-commit validation runner"
  homepage "https://steveasleep.com/localci/"
  version "0.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/irskep/localci/releases/download/v0.2.10/localci_0.2.10_darwin_arm64.tar.gz"
      sha256 "b43e0883485a60ae53e439fdc254dd21167fe9c5922910f92d7a6c79c2f2e674"
    end

    on_intel do
      url "https://github.com/irskep/localci/releases/download/v0.2.10/localci_0.2.10_darwin_amd64.tar.gz"
      sha256 "566067af107269f2422b8e37eeb850beb5fa1a8067f3cc732f30a03779567981"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irskep/localci/releases/download/v0.2.10/localci_0.2.10_linux_arm64.tar.gz"
      sha256 "f9594bafc7edb58d514ee2f06e794bec9c12e729984c4f3b3b97782621a33cf9"
    end

    on_intel do
      url "https://github.com/irskep/localci/releases/download/v0.2.10/localci_0.2.10_linux_amd64.tar.gz"
      sha256 "649dca2510cc9fa0b5e20abb03ea3525ea4d088a74c336374c9305718de79faf"
    end
  end

  def install
    bin.install "localci"

    generate_completions_from_executable(bin/"localci", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/localci --version")
  end
end
