class Post
	attr_accessor :title, :content, :user_id

	def self.find(id)
		db = SQLite3::Database.new('blog.db')
		db.results_as_hash = true

		query = db.execute("SELECT * FROM posts WHERE id = #{id}").first

		post = false
		if query
			post = new(query["title"], query["content"], query["user_id"])
		end

		post
	end

	def initialize(title, content, user_id)
		@title = title,
		@content = content,
		@user_id = user_id
	end
end