require_relative 'questions_database'

class Reply

    def self.find_by_id(id)
        data = QuestionDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless data.id

        Reply.new(data.first)
    end

    attr_accessor :question_id, :parent_reply_id, :user_id, :body
    attr_reader :id
    
    def initialize(options)
        @id = options['id']
        @question_id = options ['question_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @body = options['body']
    end

end