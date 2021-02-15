module ApplicationHelper
  def gravatar_for(user, options = { size: 80})
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://lh3.googleusercontent.com/ogw/ADGmqu-Z9gDu0ko-raKGB9pvC_QYtkxNc2v3i9_-gOor=s83-c-mo"
    image_tag(gravatar_url, alt: user.name, class: "rounded shadow mx-auto d-block")
  end
end
