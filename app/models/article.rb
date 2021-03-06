class Article < ActiveRecord::Base
    belongs_to :user

    has_many :article_categories
    has_many :categories, through: :article_categories

    #   validations
    #
    #   title validation: must have a title
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }

    #   description validation: must have a description
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }

    validates :user_id, presence: true

end
