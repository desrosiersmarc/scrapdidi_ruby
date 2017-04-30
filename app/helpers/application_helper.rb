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

  def helper_price(price)
    number_to_currency(price/100.00, unit: "€", format: "%n %u")
  end

  def helper_step(active_step)
    all_steps = content_tag(:p, "")
    steps = ["Mon Panier", "Livraison", "Paiement", "Confirmation"]
    steps.each do |step|
      if step == active_step
        if all_steps.size == 7
          all_steps = all_steps + content_tag(:p, step, class: "step-first-active" )
        else
          all_steps = all_steps + content_tag(:p, step, class: "step-active" )
        end
      else
        if all_steps.size == 7
          all_steps = all_steps + content_tag(:p, step, class: "step-first-non-active" )
        else
          all_steps = all_steps + content_tag(:p,step, class: "step-non-active")
        end
      end
    end
    all_steps
  end
end
