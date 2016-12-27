class Bill < ActiveRecord::Base

  belongs_to :user
  belongs_to :type_of_bill
  has_many :compies


 # validates :sum,:document, presence: true

  #adding PDF files
  has_attached_file :document, styles: {thumbnail: "60x60#"}
  validates_attachment :document, content_type: { content_type: "application/pdf" }
  validates :sum, presence: true
end
