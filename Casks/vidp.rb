# frozen_string_literal: true

cask "vidp" do
  version "0.18.0"
  sha256 "3e6f6a6b96d7362820ad82aacac5d223e91d3274d2fa5cc3a925a6ecf65c1b72"

  url "https://github.com/vidplabs/vidp/releases/download/v#{version}/vidp.app.zip"
  name "vidp"
  desc "Minimal keyboard-driven video player built on libmpv"
  homepage "https://github.com/vidplabs/vidp"

  depends_on macos: :tahoe

  app "vidp.app"

  # Ad-hoc signed, not notarized, so Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/vidp.app"],
        must_succeed: false
  end
end
