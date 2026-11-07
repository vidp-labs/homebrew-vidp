# frozen_string_literal: true

cask "vidp" do
  version "0.17.2"
  sha256 "a6b0789234bfafb9f354c6edeaa00f42eea5828b43028171ce3c7b38d06a3f85"

  url "https://github.com/vidp-org/vidp/releases/download/v#{version}/vidp.app.zip"
  name "vidp"
  desc "Minimal keyboard-driven video player built on libmpv"
  homepage "https://github.com/vidp-org/vidp"

  depends_on macos: :tahoe

  app "vidp.app"

  # Ad-hoc signed, not notarized, so Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/vidp.app"],
        must_succeed: false
  end
end
