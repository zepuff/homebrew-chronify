class Chronify < Formula
  include Language::Python::Virtualenv

  desc "Menu bar work tracker with local-AI daily statuses and invoicing"
  homepage "https://github.com/zepuff/Chronify"
  url "https://github.com/zepuff/Chronify/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "431b7260d8f59f4ed6ce8c719fc955cd3cb2201604b954dffd4b36cb279d8e2d"
  license "GPL-3.0-or-later"

  # Pillow is built from source by Homebrew, so its image libraries are needed
  depends_on "pkgconf" => :build
  depends_on "freetype"
  depends_on "jpeg-turbo"
  depends_on "libtiff"
  depends_on "libyaml"
  depends_on "little-cms2"
  depends_on :macos
  depends_on "openjpeg"
  depends_on "python@3.13"
  depends_on "webp"

  # ---------------------------------------------------------------------------
  # Do NOT write the resource blocks by hand. After the url and sha256 above are
  # real, run:   brew update-python-resources chronify
  # It fetches every dependency from PyPI and inserts the resource blocks here.
  # ---------------------------------------------------------------------------

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a/certifi-2026.7.22.tar.gz"
    sha256 "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e5/3f/143b048436775b0f76ac3eec145c019e8173ccc2885c8f20319b996d5e83/charset_normalizer-3.5.1.tar.gz"
    sha256 "6117b84ea48435e5356dc737f5121485c30920ba43375fa7b434fd753df0eac3"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/5f/f7/abb373e5757eaec4b922b92f97ec8d6d7e057cf06778247604fbc4e7c3f3/idna-3.19.tar.gz"
    sha256 "5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15"
  end

  resource "pillow" do
    url "https://files.pythonhosted.org/packages/1c/3d/bb7fca845737cf9d7dbde16ed1843984665ff2e0a518f5db43e77ec540b9/pillow-12.3.0.tar.gz"
    sha256 "3b8182a766685eaa002637e28b4ec8d6b18819a0c71f579bf0dbaa5830297cce"
  end

  resource "pyobjc-core" do
    url "https://files.pythonhosted.org/packages/a5/78/abc4ce5920305780aeb36b4067a86253378b36e29ba96673a3deb02eb03a/pyobjc_core-12.2.2.tar.gz"
    sha256 "3906452339cd06a3bb07df103c2511d4cb0f7a22d8771c0b802eba15d9a642b6"
  end

  resource "pyobjc-framework-cocoa" do
    url "https://files.pythonhosted.org/packages/75/76/49c6da2c6a831020b4854ba20079d5a1030474bffc776b7b73c2eeff8c15/pyobjc_framework_cocoa-12.2.2.tar.gz"
    sha256 "c96c0ef69a71afbbb0e6a7d594b455c5fe47d62e0db376ee7a2b4b828c16ace9"
  end

  resource "pyobjc-framework-quartz" do
    url "https://files.pythonhosted.org/packages/35/b1/426a37c7ae37280b3ffca2571fb48f211946aee2f4ca31a603ed1943c4a7/pyobjc_framework_quartz-12.2.2.tar.gz"
    sha256 "810f97b210cfd93704d240860286dfd6df09f9f1c52525fc5c2166723aea3f9e"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/ac/c3/e2a2b89f2d3e2179abd6d00ebd70bff6273f37fb3e0cc209f48b39d00cbf/requests-2.34.2.tar.gz"
    sha256 "f288924cae4e29463698d6d60bc6a4da69c89185ad1e0bcc4104f584e960b9ed"
  end

  resource "rumps" do
    url "https://files.pythonhosted.org/packages/b2/e2/2e6a47951290bd1a2831dcc50aec4b25d104c0cf00e8b7868cbd29cf3bfe/rumps-0.4.0.tar.gz"
    sha256 "17fb33c21b54b1e25db0d71d1d793dc19dc3c0b7d8c79dc6d833d0cffc8b1596"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953/urllib3-2.7.0.tar.gz"
    sha256 "231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c"
  end

  def install
    virtualenv_install_with_resources
  end

  service do
    run opt_bin/"chronify"
    keep_alive crashed: true
    log_path var/"log/chronify.log"
    error_log_path var/"log/chronify.log"
  end

  def caveats
    <<~EOS
      Chronify is a menu bar app — start it with:
        chronify

      To start it automatically at login:
        brew services start chronify

      macOS will ask for two permissions on first launch:
        * Screen Recording — without it window titles are invisible and every
          entry is logged as a bare app name, with no task breakdown.
        * Notifications — otherwise timed reminders never fire.

      Optional extras:
        brew install ollama && brew services start ollama && ollama pull qwen2.5:3b
        brew install --cask libreoffice   # PDF export for invoices

      Settings and data live in ~/.work_tracker/ (config.yaml is created there
      on first run and is never touched by upgrades).
    EOS
  end

  test do
    assert_match "chronify #{version}", shell_output("#{bin}/chronify --version")
  end
end
