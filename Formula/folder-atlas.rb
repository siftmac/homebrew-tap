class FolderAtlas < Formula
  desc "Tells you whether a folder on your Mac is safe to delete, and how to clear it"
  homepage "https://github.com/siftmac/mac-folder-atlas"
  url "https://github.com/siftmac/mac-folder-atlas/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "47f153e9c324f4f57dddbba493c3a57fd30983c15aef0728eedcdb24aee06814"
  license all_of: ["MIT", "CC-BY-4.0"]
  head "https://github.com/siftmac/mac-folder-atlas.git", branch: "main"

  def install
    bin.install "bin/folder-atlas"
  end

  test do
    assert_match "folder-atlas #{version}", shell_output("#{bin}/folder-atlas --version")
    assert_match "\"id\":\"library-caches\"", shell_output("#{bin}/folder-atlas --json #{testpath}/Library/Caches")
    assert_match "Leave it", shell_output("#{bin}/folder-atlas /opt/homebrew/Cellar")
  end
end
