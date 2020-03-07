class Burger < ApplicationRecord
    #Call openfoodfacts API
    def nutriments
        code = self.code
        @product = Openfoodfacts::Product.get(code, locale: 'fr')
        if(@product) 
            @nutriments = @product.nutriments
            #p @nutriments
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
        else
            @resultset = [
                "salt" => "",
                "salt_unit" => "", 
                "sugars" => "",
                "sugars_unit" => "",
                "proteins" => "",
                "proteins_unit" => "",
                "sodium" => "",
                "sodium_unit" => "",
                'energy' => "",
                'energy_unit' => "",
            ]
        end
    end
end
