module ApplicationHelper
  def all_views_side_error_messages!(resource)
    return '' if resource.errors.empty?
    flash.now[:error] = resource.errors.full_messages.map { |msg| "#{msg}." }[0]
  end

end
