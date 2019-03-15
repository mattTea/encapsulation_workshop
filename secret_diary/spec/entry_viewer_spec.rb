# this does no work!

require "entry_viewer"

describe EntryViewer do
  describe "viewing a list of diary entries" do
    let(:entry1) { double :entry1 }
    let(:entry2) { double :entry2 }
    let(:entries) { [entry1, entry2] }

    subject { described_class.new(entries) }

    it "prints each entry on a separate line" do
      allow(entries[0]).to receive(:text).and_return("A diary entry")
      
      allow(entries[1]).to receive(:text).and_return("Another diary entry")

      expect(subject.to_string(entries))
        .to eq "A diary entry\nAnother diary entry"
    end
  end
end
