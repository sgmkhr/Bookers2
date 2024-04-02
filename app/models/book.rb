class Book < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :user
  
  def get_book_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else 
      image.variant(resize_to_limit: [width, height]).processed
    end 
  end 
  
  
  
end
