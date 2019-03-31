require "sinatra"
require "pg"
require 'json'
require "./components/db"
require "./models/records"
require "./models/users"
require "./models/ivents"
include FileUtils::Verbose

enable :sessions

get "/" do
	@records = Records::list_records
	@users = Users::show_users
	erb :index
end

get "/add/" do
	erb :form
end

get "/record/:id" do
	@record = Records::page_record(params['id'])
	erb :record
	
end

get "/new_record/" do
	erb :form
end

post "/add_record/" do
	Records::add_record(params['title'], params['text'])
	redirect to('/')
end

post "/change_record/" do
 	Records::change_record(params['id'], params['title'], params['text'])
end

get "/delete_record/:id" do
 	Records::delete_record(params['id'])
end

get "/ivents/:user_id" do
 	Ivents::show_ivents(params['user_id']).to_json
end

post "/add_ivent/" do
	Ivents::add_ivent(params['user_id'], params['name'])
end

get "/remove_ivent/:id" do
	Ivents::remove_ivent(params['id'])
end

get  "/filter_users_ivents/:id" do
	@users = Users::filter_users_ivents(params['id'])
	erb :users
end

post "/logoin/" do
	if params['login'] == 'login' && params['password'] == 'password'
		session['login'] = params['login']
		redirect to('/')
	else
		"error password or login"
	end
end

not_found do
	status 404
	"Something wrong! Try to type URL correctly or call to UFO."
end
