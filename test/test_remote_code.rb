# ~*~ encoding: utf-8 ~*~
require File.expand_path( '../helper', __FILE__ )
require File.expand_path( '../wiki_factory', __FILE__ )

context "remote_code" do

  def page_with_content c
    index = @wiki.repo.index
    index.add 'Sample-Html.md', c
    index.commit 'adding file html sample'

    page = @wiki.page 'Sample Html'
    page
  end

  setup do
    # context
    @wiki, @path, @cleanup = WikiFactory.create 'examples/test.git'
  end

  test 'contents' do
    g = Gollum::RemoteCode.new 'https://raw.github.com/gollum/gollum-lib/master/test/file_view/1_file.txt'

    expected = %{<ol class=\"tree\">\n  <li class=\"file\">\n    <a href=\"0\"><span class=\"icon\"></span>0</a>\n  </li>\n</ol>\n}
    assert_html_equal expected, g.contents
  end

  test "remote_code relative no file" do
    @wiki.write_page("Bilbo Baggins", :markdown, "a\n```python:no-file-exists.py```\nb", commit_details)
    page = @wiki.page('Bilbo Baggins')
    output = page.formatted_data
    assert_html_equal %Q{<p>a\nFile not found: no-file-exists.py\nb</p>}, output
  end

  test "remote_code absolute no file" do
    @wiki.write_page("Bilbo Baggins", :markdown, "a\n```python:/monkey/no-file-exists.py```\nb", commit_details)
    page = @wiki.page('Bilbo Baggins')
    output = page.formatted_data
    assert_html_equal %Q{<p>a\nFile not found: /monkey/no-file-exists.py\nb</p>}, output
  end

  test "remote_code error generates santized html" do
    @wiki.write_page("Bilbo Baggins", :markdown, "a\n```python:<script>foo</script>```\nb", commit_details)
    page = @wiki.page('Bilbo Baggins')
    output = page.formatted_data
    assert_html_equal %Q{<p>a\nFile not found: &lt;script&gt;foo&lt;/script&gt;\nb</p>}, output
  end

  teardown do
    @cleanup.call
  end
end
