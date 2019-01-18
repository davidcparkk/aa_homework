class LRUCache
  attr_reader :cache_size
   def initialize(cache_size)
     @cache_size = cache_size
     @store = []
   end

   def count
     self.store.count
     # returns number of elements currently in cache
   end

   def add(el)
     if self.store.count >= 4
       if self.store.include?(el)
         self.store.delete(el)
         self.store.push(el)
       else
         self.store.shift
         self.store.push(el)
       end
     else
        self.store.push(el) unless self.store.include?(el)
      end
     # adds element to cache according to LRU principle
   end

   def show
     p self.store
     # shows the items in the cache, with the LRU item first
   end

   private
   # helper methods go here!

 end
