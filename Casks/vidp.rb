# frozen_string_literal: true

cask "vidp" do
  version "0.17.1"
  sha256 "e7397bf2dbacda8a714d567706f17219521d2fd18a27ec78ce99695f79ba526f"

  url "https://github.com/vidp-org/vidp/releases/download/v#{version}/vidp.app.zip"
  name "vidp"
  desc "Minimal keyboard-driven video player built on libmpv"
  homepage "https://github.com/vidp-org/vidp"

  depends_on macos: :ventura

  app "vidp.app"

  # Ad-hoc signed, not notarized, so Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/vidp.app"],
        must_succeed: false
  end
end
