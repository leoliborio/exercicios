require 'sinatra'

get '/' do
	erb :index
end

post '/result' do
	input1 = params["input1"].to_f
	input2 = params["input2"].to_f

	avg = (input1 + input2)/2

	erb :result, locals: { avg: avg }
end