class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id=nil, name=nil, type=nil, db)
        @id = id
        @name = name
        @type = type
        @db = {:conn => SQLite3::Database.new("db/pokemon.db")}
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name, type)
    end

    def self.find(id_num,db)
       pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?",id_num).flatten
       Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end

end
