class Article < ApplicationRecord

  belongs_to :user

  has_and_belongs_to_many :article_categories

  has_many :polls

  has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def to_slug(string)
    string.parameterize.truncate(80, omission: '')
  end


  def self.add_slugs
    update(slug: to_slug(slug))
  end

  def to_param
    slug
  end

end
