module UsersHelper
  def has_any? (collection, type)
    if collection.any?
      render collection
    else
      return "No #{type} present."
    end
  end
end
