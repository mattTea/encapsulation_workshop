require "diary_entry"

describe DiaryEntry do
  describe "creation" do
    subject { described_class.new("New entry") }

    it "creates diary entry with some text" do
      expect(subject.text).to eq "New entry"
    end
  end
end
