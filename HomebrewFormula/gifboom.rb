class MyTool < Formula
    desc "Given a list of youtube URLs, conver all to crowd-pleasing animated gifs"
    homepage "github.com/hernamesbarbara/gifboom"
    url "TODO"
    sha256 "TODO"
  
    depends_on "ffmpeg"
    depends_on "yt-dlp"
  
    def install
      bin.install "gifboom" => "gifboom"
    end
  
    test do
      system "#{bin}/gifboom", "--version"
    end
  end
  