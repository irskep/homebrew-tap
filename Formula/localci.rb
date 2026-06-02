class Localci < Formula
  desc "Local post-commit validation runner"
  homepage "https://steveasleep.com/localci/"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/irskep/localci/releases/download/v0.2.9/localci_0.2.9_darwin_arm64.tar.gz"
      sha256 "0750cf0ad065e66eb308f4b6896eda54f1f75b43319a3c75324ee27d6a619a78"
    end

    on_intel do
      url "https://github.com/irskep/localci/releases/download/v0.2.9/localci_0.2.9_darwin_amd64.tar.gz"
      sha256 "5ba70aa2b07022a1d210312429c48d24a47f72bea82359830ca3b3f55e36f141"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irskep/localci/releases/download/v0.2.9/localci_0.2.9_linux_arm64.tar.gz"
      sha256 "1918e63a882a9d8bb841909721b49046ff53c132efacefbc8434b65547d90de6"
    end

    on_intel do
      url "https://github.com/irskep/localci/releases/download/v0.2.9/localci_0.2.9_linux_amd64.tar.gz"
      sha256 "610978cfefc92f02e591c76579ff8cf58a2a30cb5a57ddec7c4b4643d59f61b6"
    end
  end

  def install
    bin.install "localci"

    generate_completions_from_executable(bin/"localci", "completion")
  end

  test do
    assert_match "local post-commit validation runner", shell_output("#{bin}/localci --help")
  end
end
