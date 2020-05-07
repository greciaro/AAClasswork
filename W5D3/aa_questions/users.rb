require_relative 'questions_database'

class User
    attr_accessor :fname, :lname

    def self.all
        data= Questions_database.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum) }
    end



end