require_relative 'questions_database'
require_relative 'question'
require_relative 'reply'

class User
    attr_accessor :fname, :lname
    attr_reader :id

    def self.all
        data= Questions_database.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum) }
    end

    def self.find_by_id(id)
        data= Questions_database.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
            id = ?
        SQL
    end

    def self.find_by_name(fname,lname)
        data= Questions_database.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
            fname = ? AND lname = ?
        SQL
        data.map {|u| User.new(u)}

    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end


    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_author_id(id)
    end
end