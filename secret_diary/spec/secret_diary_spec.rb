require "secret_diary"

describe SecretDiary do
  let(:entry) { double :entry }
  let(:entry_class) { double :entry_class, new: entry }

  let(:diary) { SecretDiary.new }

  it "is locked initially" do
    expect(diary).to be_locked
  end

  context "when diary is initially locked" do
    it "throws error when adding entry" do
      error = "Can't add entry, diary is locked."
      expect { diary.add_entry("New entry") }.to raise_error error
    end
  
    it "throws error when getting entries" do
      error = "Can't get entries, diary is locked."
      expect { diary.get_entries }.to raise_error error
    end

    it "unlocks diary when unlock is called" do
      diary.unlock
      expect(diary).not_to be_locked 
    end
  end

  context "when diary is unlocked" do
    before(:each) { diary.unlock }
    
    it "allows an entry to be added" do
      expect(diary.add_entry("New entry", entry_class)).to include entry # <- how to make this test for behaviour not state?
    end

    it "allows get entries" do
      diary.add_entry("New entry", entry_class)
      expect(diary.get_entries).to eq diary.entries
    end

    context "when diary is locked again" do
      before(:each) { diary.lock }
      it "prevents get entries when diary is locked again" do
        error = "Can't get entries, diary is locked."
        expect { diary.get_entries }.to raise_error error
      end
  
      it "prevents add entry when diary is locked again" do
        error = "Can't add entry, diary is locked."
        expect { diary.add_entry("New entry", entry_class) }.to raise_error error
      end
    end
  end
end