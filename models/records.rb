module Records
	def self.page_record(id)

		resultSet = db_connect.query("SELECT * FROM log WHERE id = #{id}")
		resultSet.each do |result|
			return result
		end
	end

	def self.list_records()
		db_connect.query("SELECT * FROM log")
	end

	def self.add_record(title, text)
		db_connect.query("INSERT INTO log VALUES (NULL, '#{title}', '#{text}', NULL)")
	end

	def self.change_record(id, title, text)
		db_connect.query("UPDATE log SET title = '#{title}', text = '#{text}' WHERE id = #{id}")
	end

	def self.delete_record(id)
		db_connect.query("DELETE FROM log WHERE id = #{id}")
	end

	def self.change_date(id, date)
		db_connect.query("UPDATA log SET id = #{id} ts = #{date})")
	end
	# дожно работать SELECT COUNT(*) FROM table;

end