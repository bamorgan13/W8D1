require_relative 'questions_database'

class User

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless data.first['id']

        User.new(data.first)
    end

    attr_accessor :fname, :lname
    attr_reader :id

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options ['lname']
    end

end