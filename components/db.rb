def db_connect
	client = Mysql2::Client.new(
		:host => "127.0.0.1", 
		:username => "test_user", 
		:password => "test_pass", 
		:database => "test"
	)
end
