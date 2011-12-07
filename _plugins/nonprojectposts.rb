module Jekyll
  
  class Site
    
    def nonprojectposts
      post_col = []
      self.posts.each do |post|
        post_col << post unless post.categories.include?("projects")
      end

      return post_col.reverse
    end

    # Redefine site_payload to include our posts by year.  This is ugly
    # but I don't know how else to do this without changing the jekyll code
    # itself.  #rubynoob
    def site_payload
      {"site" => self.config.merge({
          "time"       => self.time,
          "posts"      => self.posts.sort { |a,b| b <=> a },
          "pages"      => self.pages,
          "html_pages" => self.pages.reject { |page| !page.html? },
          "categories" => post_attr_hash('categories'),
          "tags"       => post_attr_hash('tags'),
          "nonprojectposts" => self.nonprojectposts
       })}
    end

  end

end