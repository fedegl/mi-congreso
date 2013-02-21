class Session < ActiveRecord::Base
  attr_accessible :date, :number

  has_many  :votes, dependent: :destroy
  has_many  :assistances, dependent: :destroy

  def name
    I18n.t("sessions.name", number: self.number)
  end

  def generate_assistances!
    Party.official_ids.each do |official_id|
      scraper = Scraper::Assistances.new(self.number, official_id)
      scraper.deputies.each do |deputy_assistance|
        Assistance.create_from_scraper(self, deputy_assistance)
      end
    end
  end
end