/* global Given, Then, When */

import LoginPage from '../pageobjects/LoginPage'
const loginPage = new LoginPage

Given("acesso o site CWI", () => {
    loginPage.acessarSite();
    console.log("Given acesso o site CWI");
})

When("acesso a pagina de login", () => {
    loginPage.clicarBotaoPaginaLogin();
    console.log("When acesso a pagina de login");
})

Then("devo visualizar botao de recuperar senha esquecida", () => {
    loginPage.visualizarBotaoRecuperarSenha();
    console.log("Then devo visualizar botao de recuperar senha esquecida");
})