require 'sinatra'
require 'sqlite3'
require './post'

get '/' do
	db = SQLite3::Database.new('blog.db')
	db.results_as_hash = true

	@entries = db.execute("SELECT * FROM posts");

	erb :index
end

get '/post/new' do
	db = SQLite3::Database.new('blog.db')
	db.results_as_hash = true

	@entries = db.execute("SELECT * FROM users")

	erb :new_post
end

get '/post/:id' do
	@post = Post.find(params[:id])

	if @post
		erb :post
	else
		"Nenhum post encontrado"
	end
end

get '/signup' do
	erb :signup
end

post '/signup' do
	db = SQLite3::Database.new('blog.db')

	user_name = params["name"]
	user_email = params["email"]
	user_password = params["password"]

	db.execute("INSERT INTO users(name, email, password) VALUES ('#{user_name}','#{user_email}','#{user_password}')")

	redirect '/'
end

post '/post/create' do 

	db = SQLite3::Database.new('blog.db')
	db.results_as_hash = true

	@entries = db.execute("SELECT * FROM posts")

	post_title = params["title"]
	post_content = params["content"]
	post_user_id = params["user_id"]

	db.execute("INSERT INTO posts(title, content, user_id) VALUES ('#{post_title}','#{post_content}','#{post_user_id}')")

	@entries = db.execute("SELECT * FROM posts")
	@post = Post.new(post_title, post_content, post_user_id)

	erb :create

end





