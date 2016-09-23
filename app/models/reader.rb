class Reader < ActiveRecord::Base
 has_many  :books 
 validates_presence_of :name, :email, :password

  has_secure_password

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Reader.all.find{|reader| reader.slug == slug}
  end
end
