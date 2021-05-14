/* global Given, Then, When */

import GooglePage from '../pageobjects/GooglePage'
const googlePage = new GooglePage



Given("acesso o Google", () => {
    cy.visit('https://www.google.com/');
    console.log("Acesso o Google.")
})

When("clico na barra de busca", () => {
    googlePage.clicarNaBarraDePesquisa();
    console.log("Clico na barra de busca");
})

Then("escrevo qualquer texto", () => {
    console.log('Escrevo qualquer texto');
})

And("clico no botão pesquisar", () => {
    googlePage.clicarNoBotaoDePesquisa();
    console.log('Clico no botão pesquisar.');
})

And("pressiono enter", () => {
    googlePage.pressionarEnter();
    console.log('Pressiono Enter.');
})

Then("clico em estou com sorte", () => {
    googlePage.clicarNoBotaoEstouComSorte();
    console.log('Clico no botão estou com sorte.')
})
