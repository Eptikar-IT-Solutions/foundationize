module Foundationize

  module ViewHelpers

    def foundationize_flash
      flash_messages = []
      flash.each do |type, message|
        
        next if message.blank?

        type = :alert       if type == :error
        type = :success     if type == :success
        type = :secondary   if type == :notice

        Array(message).each do |msg|
          flash = raw("<div data-alert class=\"alert-box #{type}\">#{msg.html_safe}<a href=\"#\" class=\"close\">&times;</a></div>");
          flash_messages << flash if msg
        end
      end
      flash_messages.join("\n").html_safe
    end

    def top_bar(options={}, &block)
      content_tag :nav, class: "top-bar" do
        content = ""
        content += content_tag :li, content_tag(:h1, link_to(options[:title],"#")), class: "name"
        content += content_tag :li, link_to(options[:text], "#"), class: options[:icon] ? "toggle-topbar menu-icon" : "toggle-topbar" 
        
        html = content_tag :ul, raw(content), class: "title-area"

        content = capture(&block)
        html +=content_tag :section, content, class: "top-bar-section"
        raw html
      end
    end

    def left_section(&block)
      top_bar_section("left", &block)
    end

    def right_section(&block)
      top_bar_section("right", &block)
    end

    def top_bar_section(direction, &block)
      content_tag :ul, class: direction do
        yield
      end
    end

    def menu_item(url, text, options={})
      html = ""
      html += menu_divider if options[:divider]
      html += content_tag :li, link_to(url,text), class: options[:active] ? "active" : ""
      raw html
    end

    def menu_label(text)
      content_tag :li, content_tag(:label,text)
    end

    def dropdown_menu(url, text, options={}, &block)
      html = ""
      content_tag :li, class: options[:active] ? "has-dropdown active" : "has-dropdown" do
        html += link_to(url,text)
        content = capture(&block)
        html += content_tag :ul, content, class: "dropdown"
        raw html
      end
    end

    def menu_divider (hide = false)
      content_tag :li, nil, class: hide ? "divider hide-for-small" : "divider"
    end

  end
  
end