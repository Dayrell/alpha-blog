class Article < ActiveRecord::Base

    #   validations
    #
    #   title validation: must have a title 
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }

    #   description validation: must have a description
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }

end