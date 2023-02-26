class CleaningRecipe < ApplicationRecord
  has_one_attached :recipe_image
  belongs_to :post
  
  def get_recipe_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io:File.open(file_path),filename: 'no_image.jpg',content_type: 'image/jpeg')
    end
    recipe_image.variant(resize_to_limit:[width,height]).processed
  end
end
