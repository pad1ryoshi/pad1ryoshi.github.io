module Jekyll
    class TagPageGenerator < Generator
      safe true
      
      def generate(site)
        if site.layouts.key? 'tag'
          site.tags.each_key do |tag|
            site.pages << TagPage.new(site, tag)
          end
        end
      end
    end
  
    class TagPage < Page
      def initialize(site, tag)
        @site = site
        @base = site.source
        @dir  = File.join('tags', tag)
        @name = 'index.html'
        
        self.process(@name)
        self.data = {
          'layout' => 'tag',
          'tag' => tag
        }
      end
    end
  end