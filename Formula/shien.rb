class Shien < Formula
  desc "Background daemon application to support knowledge workers"
  homepage "https://github.com/reouno/shien"
  version "0.1.4"
  license "MIT"
  
  on_macos do
    url "https://github.com/reouno/shien/releases/download/v0.1.4/shien-darwin-arm64.tar.gz"
    sha256 "83322bbdb9b0ef550a208b968ea057042a35e1cd02d3a3dad4963f3b505c8b34"
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
