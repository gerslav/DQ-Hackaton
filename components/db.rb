def db_connect
	client = PG::Connection.new(
		:host => "ec2-54-247-70-127.eu-west-1.compute.amazonaws.com", 
		:username => "joynujisuykawh", 
		:password => "ad6f44563030d4ef81260212d1190c167b5ccbbd323d4b7f3541bbfa42d79571", 
		:database => "d7r3ik4ku140v8"
	)
end
