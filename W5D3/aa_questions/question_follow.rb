require_relative 'questions_database'

class Question_Follow
    attr_accessor :user_id, :question_id

    def self.all
        data= Questions_database.instance.execute("SELECT * FROM question_follows")
        data.map {|datum| Question_Follow.new(datum) }
    end

    def self.find_by_id(id)
        data= Questions_database.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
            id = ?
        SQL
        data.map {|q| Question_Follow.new(q)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end


end