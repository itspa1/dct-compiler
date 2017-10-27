class InputFile
  attr_accessor :name,:content,:extension

  @@lang = {
    "ruby" => "rb",
    "javascript" => "js",
    "python" => "py"
  }
  def initialize(name,content,language)
    self.name = name
    self.content = content
    self.extension = @@lang[language]
  end

  def createFile
    somefile = File.open("#{self.name}.#{self.extension}","w")
    case self.extension
    when "js"
      somefile.puts "var fs = require('fs'); var access = fs.createWriteStream('#{self.name}.txt'); access.truncate; process.stdout.write = process.stderr.write = access.write.bind(access); process.on('uncaughtException', function(err) { console.error((err && err.stack) ? err.stack : err); });"
      somefile.puts self.content
    when "py"
      somefile.puts "import sys"
      somefile.puts "sys.stdout = sys.stderr = open(\"#{self.name}.txt\",\"w\")"
      somefile.puts self.content
    else
    somefile.puts "fname = File.open(\"#{self.name}.txt\",\"w\")"
    somefile.puts "$stderr = fname"
    somefile.puts "$stdout = fname"
    somefile.puts self.content
    somefile.puts "fname.close"
    end
    somefile.close
  end

  def execute
    case self.extension
    when "js"
      cmd = "node #{self.name}.js"
      `#{cmd}`
    when "py"
      cmd = "python3 #{self.name}.py"
      `#{cmd}`
    else
    cmd = "ruby #{self.name}.rb"
    `#{cmd}`
    end
  end

  def respond
    val = File.read("#{self.name}.txt")
    case self.extension
      when "py"
        if val.split("line ").size > 1
          leftpar = val.split("line ")[0]
          ex = val.split("line ")[1].split("")[0].to_i - 2
          val = val.split("line ")[1].split("")
          val.shift
          rightpar = val.unshift(ex).join("")
          val = leftpar + "line " + rightpar
        end
      else
        if val.split("rb:").size > 1
          leftpar = val.split("rb:")[0]
          ex = val.split("rb:")[1].split("")[0].to_i - 3
          val = val.split("rb:")[1].split("")
          val.shift
          rightpar = val.unshift(ex).join("")
          val = leftpar + "rb:" + rightpar
      end
    end
    return val
  end
end
