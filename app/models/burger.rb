class Burger < ApplicationRecord
    #Call openfoodfacts API
    def nutriments
        code = "3029330003533"
        product = Openfoodfacts::Product.get(code, locale: 'fr')
        return product.nutriments.to_hash
    end
end
