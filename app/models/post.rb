class Post < ActiveRecord::Base
  has_many(:posts_categories)
  has_many(:categories, through: :posts_categories)

  validates(:title, { presence: true })
  validates(:content, { presence: true })
  validates(:publish_date, { presence: true })
  validates(:author, { presence: true })

end
