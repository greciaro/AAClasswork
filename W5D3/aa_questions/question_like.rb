require_relative 'questions_database'

class Question_Like
    attr_accessor :user_id, :question_id

    def self.all
        data= Questions_database.instance.execute("SELECT * FROM question_likes")
        data.map {|datum| Question_Like.new(datum) }
    end

    def self.find_by_id(id)
        data= Questions_database.instance.execute(<<-SQL,id)
            SELECT
                *
            FROM
                question_likes
            WHERE
            id = ?
        SQL
        data.map {|q| Question_Like.new(q)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end


end