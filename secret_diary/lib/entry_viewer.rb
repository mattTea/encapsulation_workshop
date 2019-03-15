class EntryViewer
  def initialize(entries)
    @entries = entries
  end

  def self.to_string(entries)
    entries.each_with_index do |entry, index|
      "#{index + 1}. #{entry}\n"
    end
  end
end