class Player
  attr_reader :name, :monthly_cost, :contract_length, :first_name, :last_name, :total_cost
  def initialize(name,monthly_cost,contract_length)
    @name = name
    @monthly_cost = monthly_cost
    @contract_length = contract_length
    @first_name = name[0,name.index(" ")]
    @last_name = name[name.index(" ")+1,name.length]
    @total_cost = monthly_cost * contract_length
  end
end