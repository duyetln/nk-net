module Search
  module ByTag
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def find_by_tag(*tags)
        result = []
        tags.each_with_index do |tag, index|
          set = tag.taggables.select{|taggable| taggable.class.name.eql? self.name }
          result = set if index == 0
          result &= set
        end
        result
      end
    end














  end
end
