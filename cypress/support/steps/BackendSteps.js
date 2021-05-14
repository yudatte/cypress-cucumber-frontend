import globalContext from './Base'


// let response;
// let urlAPI;
// let jsonObject;
// let fieldName = {};
// let queryParams = {};

Given("eu uso o ambiente de testes de API", () => {
    globalContext.urlAPI = `http://api.themoviedb.org`;
})

And("eu uso a rota {string}", (route) => {

    // Caso a rota tenha uma variável, ela será substituída aqui
    if(route.includes("${"))
     {
        let variableInTheURL = route.split('{').pop().split('}')[0];
        console.log(variableInTheURL);
        let newRoute = route.replace(variableInTheURL,globalContext.fieldName[variableInTheURL]);
        newRoute = newRoute.replace("${","");
        newRoute = newRoute.replace("}","");

        globalContext.urlAPI = globalContext.urlAPI + newRoute;
     }else{
        globalContext.urlAPI = globalContext.urlAPI + route;
     }
})

And("eu defino o query parameter {string} como {string}", (key, value) => {
    globalContext.queryParams[key] = value;
    console.log(globalContext.queryParams);
})

When("envio uma requisição GET", () => {
    console.log('testando')
    cy.request({
        method: 'GET',
        url: globalContext.urlAPI,
        qs: globalContext.queryParams,
        failOnStatusCode: false
    }).then(res => {
        globalContext.response = res;
        // assert.equal(response.status,200);
    })
})

Then("o status code deve ser {}", (status) => {
    assert.equal(globalContext.response.status,status);
})

And("eu salvo o valor do campo {string} do response na variável temporária {string}", (path,tempVarName) => {
    let entrada = path;
    let entradas = entrada.split("/");
    let fieldValue = globalContext.response.body;

    for(let item of entradas){
        fieldValue = readObject(fieldValue,item);     
    }

    console.log(fieldValue);
    globalContext.fieldName[tempVarName] = fieldValue;
    console.log(globalContext.fieldName[tempVarName]);
})

And("o valor salvo na variável temporária {string} deve ser {string}", (variableValue,expectedValue) => {
    assert.equal(globalContext.fieldName[variableValue],expectedValue);
})

And("o valor salvo na variável temporária {string} deve igual ao da variável temporária {string}", (variableValue1,variableValue2) => {
    assert.equal(globalContext.fieldName[variableValue1],globalContext.fieldName[variableValue2]);
})

And("eu imprimo a duração da requisição", () => {
    cy.log("A requisição levou "+ globalContext.response.duration + " ms");
})

And("eu imprimo o valor da variável temporária {string}", (tempVarName) => {
    cy.log("O valor da variável é "+ globalContext.fieldName[tempVarName] + ".");
})

And("log", () => {
    cy.log(String(globalContext.jsonObject));
    console.log("-----teste-----")
    console.log(globalContext.jsonObject);
    console.log(globalContext.response.body);
})

function readObject (obj,key) {
    let result = undefined;
    try{
        result = obj.get(String(key));
    }
        catch(e){}
    if(result === undefined){
        return obj[key];
    }
    
    return result;
}

Then("o valor do campo {string} do response JSON deve ser {string}", (jsonKey,jsonValue) => {
    let entrada = jsonKey;
    let entradas = entrada.split("/");
    let fieldValue = globalContext.response.body;

    for(let item of entradas){
        fieldValue = readObject(fieldValue,item);     
    }

    assert.equal(fieldValue,jsonValue);
})

export function clearAllVariables () {
    // Limpa todas as variáveis que serão usadas em cada teste. Essa função deve ser chamada dentro do hook before each.
    globalContext.response = null;
    globalContext.urlAPI = null;
    globalContext.jsonObject = null;
    globalContext.fieldName = {};
    globalContext.queryParams = {};
}

