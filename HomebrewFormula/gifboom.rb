class MyTool < Formula
    desc "A brief description of your tool"
    homepage "URL to your tool's homepage or GitHub repo"
    url "URL to a tarball of your tool (you can use GitHub's Releases feature)"
    sha256 "SHA256 of the tarball"
  
    depends_on "ffmpeg"
    depends_on "yt-dlp"
  
    def install
      bin.install "your_script_name" => "mytool"
    end
  
    test do
      system "#{bin}/mytool", "--version"
    end
  end
  