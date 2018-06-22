class Post < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :comments, as: :commentable
  ###!
  # O atributo :post_type é apenas para definir se o post trata-se de uma oferta de aula
  # ou uma procura por determinada aula. Sendo assim vamos delimita-lo com o seguinte:
  validates :post_type, inclusion: { in: %w(offer looking),
    message: "%{value} is not a valid post_type. Only \"offer\" and \"looking\" are allowed" }
  validates :title, :body, presence: true
end
