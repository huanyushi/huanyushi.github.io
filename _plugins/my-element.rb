module Jekyll
  class CustomTags < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      # Check if the markup contains a space, indicating both tag type and title
      if markup.strip.include?(" ")
        @box_type, @title = markup.strip.split(" ", 2)
        @title = @title&.gsub(/^"(.*)"$/, '\1')
      else
        # If no space, treat the markup as only tag type and set title to nil
        @box_type = markup.strip
        @title = nil
      end
    end

    def render(context)
      content = super
      # Generate HTML for the title if it exists, otherwise leave it empty
      title_html = @title ? "<div class=\"title\">#{@title}</div>" : ""
      # Render the appropriate box type with the title HTML and content
      case @box_type
      when "info"
        "<div class=\"box-info\" markdown=\"1\">#{title_html}#{content}</div>"
      when "tip"
        "<div class=\"box-tip\" markdown=\"1\">#{title_html}#{content}</div>"
      when "warning"
        "<div class=\"box-warning\" markdown=\"1\">#{title_html}#{content}</div>"
      when "danger"
        "<div class=\"box-danger\" markdown=\"1\">#{title_html}#{content}</div>"
      else
        # If the tag type is unknown, it renders without any additional styling
      end
    end
  end

  class Details < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      # 解析标记参数，分割为详细类型、摘要和是否开启的参数
      @detail_type, @summary, @open = markup.strip.split(" ", 3)
      # 去除摘要两侧的引号
      @summary = @summary&.gsub(/^"(.*)"$/, '\1') 
      # 如果存在 open 参数，则将 @open 设置为 true，否则设置为 false
      @open = @open == "open" ? true : false
    end

    def render(context)
      content = super
      # 根据详细类型生成相应的 HTML 结构
      case @detail_type
      when "block"
        details_html = "<details class=\"details-block\" markdown=\"1\""
      when "inline"
        details_html = "<details class=\"details-inline\" markdown=\"1\""
      else
        details_html = "<details markdown=\"1\""
      end
      # 如果 @open 为 true，则添加 open 属性
      details_html += " open" if @open
      details_html += "><summary>#{@summary}</summary>#{content}</details>"
    end
  end
end

Liquid::Template.register_tag('box', Jekyll::CustomTags)
Liquid::Template.register_tag('details', Jekyll::Details)