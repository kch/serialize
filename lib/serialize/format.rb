class Serialize
  class Format
    attr :object
    private :object

    def initialize(object, block)
      @object = object
      @block  = block
    end

    def content
      if object.is_a? Array
        object.map { |obj| Generator.new(obj, @block).to_hash }
      else
        Generator.new(object, @block).to_hash
      end
    end

    private :content
  end
end
