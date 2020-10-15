require 'rails_helper'

RSpec.describe Complaint, type: :model do
  describe '新規投稿' do
    before do
      @complaint = FactoryBot.build(:complaint)
    end

    it '全ての項目に正しい値が入力されていれば登録できること' do
      expect(@complaint).to be_valid
    end

    it 'emailが空では登録できないこと' do
      @complaint.title = nil
      @complaint.valid?
      expect(@complaint.errors.full_messages).to include("Titleを入力してください")
    end

    it 'passwordが空では登録できないこと' do
      @complaint.text = nil
      @complaint.valid?
      expect(@complaint.errors.full_messages).to include("Textを入力してください")
    end
  end
end
