require "diary_entry"
require "entry_viewer"

class SecretDiary
  attr_reader :entries
  
  def initialize(diary_class = EntryViewer)
    @locked = true
    @entries = []
  end

  def add_entry(entry, entry_class = DiaryEntry)
    error = "Can't add entry, diary is locked."
    raise error if locked?

    @entries << entry_class.new(entry)
  end

  def get_entries(entry_viewer = EntryViewer)
    error = "Can't get entries, diary is locked."
    raise error if locked?

    entry_viewer.to_string(entries)
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

  def locked?
    @locked
  end
end
