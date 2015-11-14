class Post < ActiveRecord::Base

  validates(:title, { presence: true })
  validates(:content, { presence: true })
  validates(:publish_date, { presence: true })
  validates(:author, { presence: true })

end
