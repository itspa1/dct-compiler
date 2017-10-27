class Check
  attr_accessor :name,:extension

  @@lang = {
    "ruby" => "rb",
    "javascript" => "js",
    "python" => "py"
  }

  def initialize(name,extension)
    self.name = name
    self.extension = @@lang[extension]
  end

  def has_cache
    @flag = File.exist?("temporary/#{self.name}.#{self.extension}")
    if @flag
      case self.extension
        when "js"
          file = File.readlines("temporary/#{self.name}.#{self.extension}")
          size = file.size
          @con = file[1..size].join("")
        when "py"
          file = File.readlines("temporary/#{self.name}.#{self.extension}")
          size = file.size
          @con = file[3..size].join("")
        else
          file = File.readlines("temporary/#{self.name}.#{self.extension}")
          size = file.size
          @con = file[3..size - 2].join("")
      end
      return @con
    else
      @con = "default"
      return @con
    end
  end

end
