class Shien < Formula
  desc "Background daemon application to support knowledge workers"
  homepage "https://github.com/reouno/shien"
  version "0.1.5"
  license "MIT"
  
  on_macos do
    url "https://github.com/reouno/shien/releases/download/v0.1.5/shien-darwin-arm64.tar.gz"
    sha256 "85c89c7bca8df24d26a444d3a2658917cd9b55712517c5cf414dc68c666e30b1"
  end

  def install
    bin.install "shien-service"
    bin.install "shien"
  end

  service do
    run [opt_bin/"shien-service"]
    keep_alive true
    log_path var/"log/shien-service.log"
    error_log_path var/"log/shien-service.err.log"
  end

  test do
    # Test shien help
    assert_match "shien", shell_output("#{bin}/shien --help 2>&1", 1)
    
    # Test that binaries exist
    assert_predicate bin/"shien-service", :exist?
    assert_predicate bin/"shien", :exist?
  end
end
