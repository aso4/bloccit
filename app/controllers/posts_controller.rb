class PostsController < ApplicationController

  def index
    @posts = SpamFilter.filter(Post.all, 'title', 'SPAM')
  end

  def show
  end

  def new
  end

  def edit
  end
end

class SpamFilter
  def self.filter(dataset, field, replacementString)

    fltdrd = dataset.each_with_index do |record, index|
      # Rails.logger.warn(post.id)
      if index % 5 == 0
        record[field] = replacementString
      end

    end
    fltdrd
  end
end
