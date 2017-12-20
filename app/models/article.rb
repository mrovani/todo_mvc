class Article < ApplicationRecord
  belongs_to :user

# Create a search method for searching articles

  def self.search(str)
    if str
      Article.where("title LIKE '%#{str}%' OR content LIKE '%#{str}%'")
    else
      Article.all
    end
  end
end
