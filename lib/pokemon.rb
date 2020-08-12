class Pokemon

    attr_reader :id, :name, :type, :db

    database_connection = SQLite3::Database.new('db/pokemon.db')

    def initialize(db)
        @db = db
      
    end 

   


end

# def self.save(name, breed, age, database_connection)
#     database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)",name, breed, age)
#   end
