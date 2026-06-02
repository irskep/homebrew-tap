class Autowt < Formula
  desc "Better git worktree experience"
  homepage "http://steveasleep.com/autowt/"
  version "0.6.0-rc5"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/irskep/autowt/releases/download/v0.6.0-rc5/autowt-darwin-arm64"
      sha256 "5d56c48bd84de466ad740617d381155b4fdfbbd24a3bb24f812b498d7e3d6a96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irskep/autowt/releases/download/v0.6.0-rc5/autowt-linux-arm64"
      sha256 "e34aa362f942ebf5079ba82f3faa7a1dd2a69df136ec2b0709c4a5452dbdfefa"
    end

    on_intel do
      url "https://github.com/irskep/autowt/releases/download/v0.6.0-rc5/autowt-linux-amd64"
      sha256 "faa301235e8a177cb7b15060977760c90e26ece659bfb5980fc92b0aff986d3b"
    end
  end

  resource "awt-darwin-arm64" do
    url "https://github.com/irskep/autowt/releases/download/v0.6.0-rc5/awt-darwin-arm64"
    sha256 "4d6b7f9c7e1ac2706d880f8aa4cd61082e161c055ccdbe90438d06bffe441a4f"
  end

  resource "awt-linux-amd64" do
    url "https://github.com/irskep/autowt/releases/download/v0.6.0-rc5/awt-linux-amd64"
    sha256 "f6f0968e8f63abccfd82252816db977bf53c01da993eb478b84be47ca1650ee0"
  end

  resource "awt-linux-arm64" do
    url "https://github.com/irskep/autowt/releases/download/v0.6.0-rc5/awt-linux-arm64"
    sha256 "983f5d10930b3a5c7b9f55fffa194b886074e0ad10eee6acdc818fbbfbc98d9c"
  end

  def install
    binary = Dir["autowt-*"].first
    chmod 0755, binary
    bin.install binary => "autowt"

    awt_resource =
      if OS.mac? && Hardware::CPU.arm?
        "awt-darwin-arm64"
      elsif OS.linux? && Hardware::CPU.arm?
        "awt-linux-arm64"
      elsif OS.linux?
        "awt-linux-amd64"
      end

    odie "autowt is only distributed for macOS ARM, Linux ARM, and Linux x86_64" if awt_resource.nil?

    resource(awt_resource).stage do
      awt_binary = Pathname.pwd.children.first
      chmod 0755, awt_binary
      bin.install awt_binary => "awt"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/autowt --version")
    assert_match version.to_s, shell_output("#{bin}/awt --version")
  end
end
