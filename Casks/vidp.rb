# frozen_string_literal: true

cask "vidp" do
  version "0.18.1"
  sha256 "8120a3a5c13acec7f672548633fd53bc621a209139a7f27b462242636fe5385e"

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
