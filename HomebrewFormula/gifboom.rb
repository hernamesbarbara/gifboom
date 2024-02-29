class Gifboom < Formula
  desc "Given a list of youtube URLs, convert all to crowd-pleasing animated gifs"
  homepage "https://github.com/hernamesbarbara/gifboom"
  url "https://github.com/hernamesbarbara/gifboom/releases/download/v1.0.0/gifboom-v1.0.0.tar.gz"
  sha256 "eb37701cee4cc9915f72206804e0ae8cb7920883458397622a1163a1dabd238d"

  depends_on "ffmpeg", "yt-dlp"

  def install
    bin.install "src/gifboom.sh" => "gifboom"
  end

  test do
    system "#{bin}/gifboom", "--version"
  end
end
