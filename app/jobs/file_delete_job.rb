class FileDeleteJob < ApplicationJob
    queue_as :default

    def perform(answer)
      name = answer.user_id.to_s + "_" + answer.assignment_id.to_s
      @rb = File.exist?("temporary/#{name}.rb")
      @js = File.exist?("temporary/#{name}.js")
      @py = File.exist?("temporary/#{name}.py")
      if @rb
        File.delete("temporary/#{name}.rb")
      end
      if @js
        File.delete("temporary/#{name}.js")
      end
      if @py
        File.delete("temporary/#{name}.py")
      end
      File.delete("temporary/#{name}.txt")
    end
end
