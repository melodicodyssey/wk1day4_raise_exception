

class AllergyError < ArgumentError
end

class Person

	
	def initialize(name, allergies,stomach=[])
		@name = name
		@allergies = allergies
		# @allergies.class == string
		@stomach = stomach
		# @stomach.class == Array
	end

	def eat(food)
		#push food to stomach array
		for ingredient in food do
			@stomach.push(ingredient)
		end
		begin #begin resue
		if @stomach.include?(@allergies)
			@stomach = []
			puts "BARF!"
			raise AllergyError.new("allergen detected!")
		end
		rescue AllergyError => e   # rescue
			puts "There was an allergy: #{e}"
		end		#end rescue

	end


	def look_stomach
		p @stomach
	end



end

pizza = ["cheese","gluten","tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new("Chris","gluten")
beth = Person.new("Beth","scallops")

beth.eat(pizza)
beth.look_stomach
chris.eat(pan_seared_scallops)
# beth.look_stomach