# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings
configure :build do
  set :build_dir, 'docs'
end
# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end


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
