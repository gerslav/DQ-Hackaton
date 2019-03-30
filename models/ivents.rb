module Ivents
	def self.show_ivents(user_id)
		result = db_connect.query("SELECT id, name FROM Ivents WHERE user_id = #{user_id}")
		ivents = []
		result.each do |elem|
			ivents << {:name => elem['name'], :id => elem['id']}
		end
		ivents
	end

	def self.add_ivent(user_id, name)
		db_connect.query("INSERT INTO Ivents VALUES (NULL, '#{name}', #{user_id})")
	end

	def self.remove_ivent(id)
		db_connect.query("DELETE FROM Ivents WHERE id = #{id}")
	end

	def self.search_user_in_names_ivents(names, id)
		db_connect.query("SELECT user_id FROM Ivents WHERE name IN #{names} AND NOT user_id = #{id}")
	end

end