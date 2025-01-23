class ItemParser
  def parse_file(file_path)
    items = []
    File.foreach(file_path) do |line|
      items << line
    end
    items
  end
end
