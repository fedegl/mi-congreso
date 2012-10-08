class Initiative < ActiveRecord::Base
  attr_accessible :title, :description, :original_document_url, :presented_at, :member_id, :summary_by, :subject_ids

  belongs_to :member
  has_and_belongs_to_many :subjects
end
