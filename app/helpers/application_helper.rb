module ApplicationHelper

  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

    def markdown(text)
      render_options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow' }
      }
      renderer = HTML.new(render_options)

      extensions = {
        autolink:           true,
        fenced_code_blocks: true,
        lax_spacing:        true,
        no_intra_emphasis:  true,
        strikethrough:      true,
        superscript:        true
      }
      Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
    end

    def gravatar_for(user, size = nil)
      if size
        image_tag user.gravatar_url(size: size), class: "profile-image"
      else
        image_tag user.gravatar_url, class: "profile-image"
      end
    end

end
