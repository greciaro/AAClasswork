require_relative 'questions_database'

class Question
    attr_accessor :title, :body, :author_id

    def self.all
        data= Questions_database.instance.execute("SELECT * FROM questions")
        data.map {|datum| Question.new(datum) }
    end

    def self.find_by_id(id)
        data= Questions_database.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
            id = ?
        SQL
        data.map {|q| Question.new(q)}
    end

    def self.find_by_author_id(author_id)
        data= Questions_database.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
            author_id = ?
        SQL
        data.map {|q| Question.new(q)}

    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

end