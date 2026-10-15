class Portman < Formula
  desc "Inspect processes listening on a local TCP port"
  homepage "https://github.com/arps18/portman"
  version "0.2.0"
  license "MIT"

  depends_on :macos

  on_arm do
    url "https://github.com/arps18/portman/releases/download/v0.2.0/portman_darwin_arm64.tar.gz"
    sha256 "0165e12dab503319333621d8a66e127dbb1ad2add22e23009687312ebd90fb62"
  end

  on_intel do
    url "https://github.com/arps18/portman/releases/download/v0.2.0/portman_darwin_amd64.tar.gz"
    sha256 "87124258a8222110c9fc5bdd4dc8be0908d4db5157ff9abd096d29a7844221b7"
  end
  
  def install
    bin.install "portman"
  end

  test do
    output = shell_output("#{bin}/portman 70000 2>&1", 1)
    assert_match "port must be between 1 and 65535", output
    assert_equal "v0.2.0", shell_output("#{bin}/portman --version").strip
  end
end