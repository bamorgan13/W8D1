require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'
require_relative 'question_follow'
require_relative 'question_like'

class Question

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless data.first['id']

        Question.new(data.first)
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                user_id = ?
        SQL

        data.map {|datum| Question.new(datum)}
    end

    attr_accessor :title, :body, :user_id
    attr_reader :id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options ['body']
        @user_id = options['user_id']
    end

    def author
        User.find_by_id(user_id)
    end

    def replies
        Reply.find_by_question_id(id)
    end

end