class Article < ApplicationRecord

  paginates_per 5


  belongs_to :user

  has_and_belongs_to_many :article_categories

  has_many :polls

  before_save :slug_slug

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

  def slug_slug
    self.slug = to_slug(self.title)
  end

  def self.add_slugs
    update(slug: to_slug(slug))
  end

  def to_param
    slug
  end


  def previous
    Article.where(["id < ?", id]).last
  end

  def next
    Article.where(["id > ?", id]).first
  end

end
