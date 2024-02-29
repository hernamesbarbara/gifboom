class Gifboom < Formula
  desc "Given a list of youtube URLs, convert all to crowd-pleasing animated gifs"
  homepage "https://github.com/hernamesbarbara/gifboom"
  url "https://github.com/hernamesbarbara/gifboom/releases/download/v1.0.1/gifboom-v1.0.0.tar.gz"
  sha256 "012f3b1714780071a836031c3eb1dff681c06e31ffd589e8e84a97c567359f1b"

  depends_on "ffmpeg", "yt-dlp"

  def install
    bin.install "src/gifboom.sh" => "gifboom"
  end

  test do
    system "#{bin}/gifboom", "--version"
  end
end
