module FoundationizeHelper

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

end
