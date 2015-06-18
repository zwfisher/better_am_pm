module BetterAmPmHelper
  def show_meridian
    content_tag(:div, '', class: 'ampm-meridian') + "\n".html_safe
  end
end

ActionView::Base.send :include, BetterAmPmHelper
