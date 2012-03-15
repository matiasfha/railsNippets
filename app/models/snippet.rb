class Snippet < ActiveRecord::Base
  validates_presence_of :title,:codigo,:descripcion,:lenguaje
  validates_uniqueness_of :title
  has_many :lenguajes
  acts_as_taggable

  def self.search(search)
     if search
	find(:all,:conditions => ['title LIKE ?', "%#{search}%"])
     else
	find(:all)
     end
  end

end
