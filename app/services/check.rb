class Check
  attr_accessor :uid,:aid,:lang

  def initialize(uid,aid,lang)
    self.uid = uid
    self.aid = aid
    self.lang = lang
  end

  def has_cache
    @flag = Answer.where(user_id: self.uid,assignment_id: self.aid,language: self.lang)
    if @flag.empty?
      @con = {"statement"=> "default"}
      return @con
    else
      @con = @flag.first
    end
    return @con
  end
#class end
end
