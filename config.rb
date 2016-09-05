###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


# With alternative layout
# page "/path/to/file.html", layout: :otherlayout


[:en, :tr].each do |locale|
  data.people.people.each do |r|
    proxy "/#{locale}/people/#{r.id}.html", "/localizable/people_page.html",
          locals: {json: "data._#{r.id}"},
          lang: locale,
          ignore: true # TODO funktioniert nicht, wegen den locales?
  end
end

#ignore "/localizable/people_page.html"

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
# which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

activate :sprockets

activate :i18n, mount_at_root: false

# also activate :relative_assets
set :relative_links, true

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def is_menu_active menu, page
    menu == page.data.menu ? "active" : "inactive"
  end

  def current_path_without_locale
    current_path[3..-1]  # ohne en/ oder tr/
  end


end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
  activate :relative_assets


end
