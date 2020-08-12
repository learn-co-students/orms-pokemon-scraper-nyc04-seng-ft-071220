class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        #need to review  => db.execute & difference between ? and NULL
        #We know making an instance of a class would be Pokemon.new
        #But since we are making an instance with the database pokemon, need to INSERT INTO to make an instance
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        #db.execute("SELECT * FROM pokemon WHERE pokemon.id = id") where we got stuck
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        # Creating new Pokemon instance with info from finding it
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end

end
