module ApplicationHelper

    # Returns the full title on a per-page basis.
    def full_title(page_title = '')
      base_title = "RAD 2020"
      if page_title.empty?
        base_title
      else
        page_title + " | " + base_title
      end
    end
  end