class Burger < ApplicationRecord
    #Call openfoodfacts API
    def nutriments
        code = self.code
        product = Openfoodfacts::Product.get(code, locale: 'fr')
        return product.nutriments.to_hash
    end
end
