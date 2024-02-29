class Gifboom < Formula
    desc "Given a list of youtube URLs, convert all to crowd-pleasing animated gifs"
    homepage "github.com/hernamesbarbara/gifboom"
    url "TODO"
    sha256 "TODO"
  
    depends_on "ffmpeg"
    depends_on "yt-dlp"
  
    def install
      bin.install "src/gifboom.sh" => "gifboom"
    end
  
    test do
      system "#{bin}/src/gifboom.sh", "--version"
    end
  end
  