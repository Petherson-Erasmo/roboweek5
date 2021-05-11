* Settings *
Resource        ${EXECDIR}/resources/base.robot

#Hooks
Test Setup      Start Session
Test Teardown   Take Screenshot

* Test Cases *
Deve adcionar um item ao carrinho
    &{restaurante}      Create Dictionary       restaurant=STARBUGS COFFEE        desc=Nada melhor que um café pra te ajudar a resolver um bug.

    Go To Restaurant

    Choose Restaurant       ${restaurante}
    Add To Cart             Starbugs 500 error
    Should Add To Cart      Starbugs 500 error
    Total Cart Should Be    15,60

Deve adcionar 3 itens ao carrinho
    [Tags]              temp
    ${cart_json}            Get JSON    cart.json

    Go To Restaurant

    Choose Restaurant       ${cart_json}

    FOR     ${product}      IN      @{cart_json["products"]}
        Add To Cart             ${product["name"]}
        Should Add To Cart      ${product["name"]}
    END


    Total Cart Should Be    ${cart_json["total"]}

