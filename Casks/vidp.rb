# frozen_string_literal: true

cask "vidp" do
  version "0.17.3"
  sha256 "c7355e775ac5415f0bf8f3912781b5a6168b47112f8606907173c30dc9f12413"

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
