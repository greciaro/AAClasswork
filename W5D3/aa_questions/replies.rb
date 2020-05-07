require_relative 'questions_database'

class Reply
    attr_accessor :question_id, :author_id, :parent_reply_id, :body  

    def self.all
        data= Questions_database.instance.execute("SELECT * FROM replies")
        data.map {|datum| Reply.new(datum) }
    end



end