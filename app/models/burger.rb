class Burger < ApplicationRecord
    #Call openfoodfacts API
    def nutriments
        code = self.code
        @product = Openfoodfacts::Product.get(code, locale: 'fr')
        if(@product)
            @nutriments = @product.nutriments
            @resultset = [
                "salt" => @nutriments.salt,
                "salt_unit" => @nutriments.salt_unit, 
                "sugars" => @nutriments.sugars,
                "sugars_unit" => @nutriments.sugars_unit,
                "proteins" => @nutriments.proteins,
                "proteins_unit" => @nutriments.proteins_unit,
                "sodium" => @nutriments.sodium,
                "sodium_unit" => @nutriments.sodium_unit,
                'energy' => @nutriments.energy,
                'energy_unit' => @nutriments.energy_unit
            ]
        #return product.nutriments.to_hash
    end
end
