require("pg")

class PropertyTracker

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @address = options["address"]
    @value = options["value"]
    @number_of_bedrooms = options["number_of_bedrooms"].to_i()
    @year_built = options["year_built"].to_i()

  end
