require_relative 'questions_database'
require_relative 'user'
require_relative 'question'

class QuestionLike

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless data.first['id']

        QuestionLike.new(data.first)
    end

    attr_accessor :user_id, :question_id
    attr_reader :id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options ['question_id']
    end

end