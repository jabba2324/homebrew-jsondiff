class Jsondiff < Formula
  desc "Command-line tool to compare two JSON files and show their differences"
  homepage "https://github.com/chrissewell/jsondiff"
  url "https://github.com/chrissewell/jsondiff/archive/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    (testpath/"test1.json").write('{"name": "John", "age": 30}')
    (testpath/"test2.json").write('{"name": "Jane", "age": 31}')
    
    output = shell_output("#{bin}/jsondiff -quiet #{testpath}/test1.json #{testpath}/test2.json", 1)
    assert_equal 1, $CHILD_STATUS.exitstatus
  end
end