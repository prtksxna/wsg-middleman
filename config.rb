activate :relative_assets
set :relative_links, true
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

configure :build do
  set :build_dir, 'docs'
end

helpers do
  def nav_link ( text, path, subitem = false, content = "" )
    current_path = current_page.url.to_s

    # Everything starts with a "/" so the matching fails
    current_path = "index.html" if current_path == "/"
    path = "index.html" if path == "/"

    is_current = ( current_path == path ) || ( subitem == false && path.start_with?( current_path.split( "--" )[0] ) )

    link_options = {}
    li_class = subitem ? "nave__sub-item" : "nav__item"
    li_class += " is-on" if is_current

    return "<li class=\"#{li_class}\">" + link_to(text, path, link_options) + content.to_s + "</li>"
  end
end
