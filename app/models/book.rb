class Book < ApplicationRecord
  
  has_one_attached :image
  
  belongs_to :user
  
  def get_book_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(oi: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else 
      image
    end 
  end 
  
end
