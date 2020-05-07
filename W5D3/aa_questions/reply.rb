require_relative 'questions_database'

class Reply
    attr_accessor :question_id, :author_id, :parent_reply_id, :body  

    def self.all
        data= Questions_database.instance.execute("SELECT * FROM replies")
        data.map {|datum| Reply.new(datum) }
    end

    def self.find_by_id(id)
        data= Questions_database.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
            id = ?
        SQL
        data.map {|r| Reply.new(r)}
    end

    def self.find_by_author_id(author_id)
        data= Questions_database.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                replies
            WHERE
            author_id = ?
        SQL
        data.map {|r| Reply.new(r)}

    end


    def self.find_by_question_id(question_id)
        data= Questions_database.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
            question_id = ?
        SQL
        data.map {|r| Reply.new(r)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @author_id = options['author_id']
        @parent_reply_id = options['parent_reply_id']
        @body = options['body']
    end

end