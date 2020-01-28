require("pg")

class PropertyTracker

  attr_accessor :address, :value, :number_of_bedrooms, :year_built

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @address = options["address"]
    @value = options["value"]
    @number_of_bedrooms = options["number_of_bedrooms"].to_i()
    @year_built = options["year_built"].to_i()
  end

  def save()
    db = PG.connect ({
      dbname: "property_tracker",
      host: "localhost"
      })
    sql = "INSERT INTO property_tracker
    (address, value, number_of_bedrooms, year_built)
    VALUES
    ($1, $2, $3, $4) RETURNING id"
    values = [@address, @value, @number_of_bedrooms, @year_built]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values).first()["id"].to_i
    db.close
  end

  def delete()
    db = PG.connect ({
      dbname: "property_tracker",
      host: "localhost"
      })
    sql = "DELETE FROM property_tracker WHERE id = $1"
    value = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", value)
    db.close()
  end

  def update()
    db = PG.connect ({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "UPDATE property_tracker
      SET
      (address, value, number_of_bedrooms, year_built) =
      ($1, $2, $3, $4)
      WHERE id = $5"
      values = [@address, @value, @number_of_bedrooms, @year_built, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end



  def PropertyTracker.all()
    db = PG.connect ({
      dbname: "property_tracker",
      host: "localhost"
      })
    sql = "SELECT * FROM property_tracker"
    db.prepare("all", sql)
    properties = db.exec_prepared("all")
    db.close
    return properties.map { |property| PropertyTracker.new(property)}
  end

  def PropertyTracker.delete_all()
    db = PG.connect ({
      dbname: "property_tracker",
      host: "localhost"
      })
      sql = "DELETE FROM property_tracker"
      db.prepare("delete_all", sql)
      db.exec_prepared("delete_all")
      db.close()
  end

end
