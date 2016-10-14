require 'json/ext'

class DataHelper

  def self.rehash_to_symbol_keys(hash)
    rehash = {}
    hash.each_pair do |key, value|
      rehash[key.to_sym] = value
    end
    rehash
  end

  # noinspection RubyArgCount
  def self.parse_json(string)
    parser = JSON::Ext::Parser.new(string)
    json = parser.parse
    json
  end

  def self.verify_type(actual_type, expected_type)
    result = false
    case expected_type
      when 'Integer'
        if actual_type.is_a? Integer
          result = true
        end
      when 'String'
        if actual_type.is_a? String
          result = true
        end
      else
        result = false
    end
    result
  end

end

