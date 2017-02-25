module ApplicationHelper
  def helper_picture_url(product)
    if product.photos?
      cl_image_path(product.photos.first.path)
    else
      "http://static.wixstatic.com/media/b6a999_c97c7e56d74149a9aed270cc83927158.jpg"
    end
  end

  def helper_picture_tag(product)
    if product.photos?
      cl_image_tag(product.photos.first.path)
    else
      image_tag("logo.png")
    end
  end
end
