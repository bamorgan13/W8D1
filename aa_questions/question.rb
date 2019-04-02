require_relative 'questions_database'

class Question

    def self.find_by_id(id)
        data = QuestionDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless data.id

        Question.new(data.first)
    end

    attr_accessor :title, :body, :user_id
    attr_reader :id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options ['body']
        @user_id = options['user_id']
    end

end