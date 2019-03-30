module Users
	LIMIT_USERS_LIST = 30

	def self.show_users()
		db_connect.query("SELECT * FROM Users")
	end

	def self.filter_users_ivents(user_id)
		ivents = Ivents::show_ivents(user_id)
		
		ivents_list = '('
		ivents.each do |elem|
			ivents_list += '"' + elem[:name] + '",'
		end
		ivents_list = ivents_list.chop + ')'
		raise "Вы не заполнили интересы" if ivents_list == ')'
		users = Ivents::search_user_in_names_ivents(ivents_list, user_id)

		counts = {}
		users.each do |id|
			counts[id["user_id"]] = (counts[id["user_id"]] || 0) + 1
		end
		raise "Сожалеем, но вы Олег! Люди, с похожими интересами не найдены" if counts.empty?
		users_list = '('
		counts.each do |key, value|
			users_list += '"' + key.to_s + '",'
			break if users_list.size > LIMIT_USERS_LIST
		end
		users_list = users_list.chop + ')'

		users_data = self.search_users(users_list)
		users_data.map do |elem|
			elem["count"] = counts[ elem["id"] ]
		end
		return users_data.sort {|x, y| y["count"] <=> x["count"]}
	end

	def self.search_users(users_list)
		db_connect.query("SELECT * FROM Users WHERE id IN #{users_list}")
	end
end