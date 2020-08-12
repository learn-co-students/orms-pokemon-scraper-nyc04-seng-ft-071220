require 'pry'
class Pokemon

    attr_reader :id, :name, :type, :db

    database_connection = SQLite3::Database.new('db/pokemon.db')

    def initialize(id:, name:, type:, db:)
        @id = id
        @type =type
        @name = name
        @db = db
    end 

   def self.save(name,type,database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

   def self.find(id, database_connection)
    new_pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?",id)
    Pokemon.new(id:new_pokemon[0][0], name:new_pokemon[0][1], type:new_pokemon[0][2], db:database_connection)

   end

end

