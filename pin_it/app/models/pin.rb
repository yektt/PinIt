class Pin < ApplicationRecord

  def self.most_recent()
    all.order(created_at: :desc).limit(6)
  end

  def self.search(search_term)
    where('title LIKE ?', "%#{search_term}%").or(where('tag LIKE ?', "%#{search_term}%"))
  end
end
