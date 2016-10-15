class BaseClassForDataClasses
attr_accessor :attributes
  def initialize(values)
    case
      when values.respond_to?(:each_pair)
        # Hash of values for accessors.
        values.each_pair do |key, value|
          send("#{key}=", value)
        end
      else
        raise ArgumentError.new(values.inspect)
    end
    nil
  end

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat vars
    # noinspection RubySuperCallWithoutSuperclassInspection
    super(*vars)
  end

  # noinspection RubyResolve
  def self.attributes
    @attributes
  end

  def attributes
    self.class.attributes
  end
end