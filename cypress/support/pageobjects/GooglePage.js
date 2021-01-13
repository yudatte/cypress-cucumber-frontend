/// <reference types="Cypress" />

import GoogleElements from '../elements/GoogleElements'
const googleElements = new GoogleElements;
const url = Cypress.config("baseUrl");

class GooglePage {
    // Acessa o site que será testado
    acessarSite() {
        cy.visit(url)
    }

    // Clica no botão que acessa a página de login do site
    clicarBotaoPaginaLogin() {
        cy.get(googleElements.botaoLogin()).click().type('aaaaa');
    }
  
    // Verifica se o botão tem o texto "Esqueceu sua senha?"
    visualizarBotaoRecuperarSenha() {
        cy.get(googleElements.botaoRecuperarSenha()).should('contain', 'Esqueceu sua senha?')
    }

    // Clica na barra de pesquisa do Google
    clicarNaBarraDePesquisa() {
        cy.get(googleElements.barraPesquisa()).click().type('teste');
    }

    // Clica no botão de pesquisa do Google
    clicarNoBotaoDePesquisa() {
        cy.get(googleElements.botaoPesquisaGoogle()).click();
    }

    // Pesquisar
    pressionarEnter() {
        cy.get(googleElements.barraPesquisa()).click().type('{enter}');
    }

    // Estou com sorte
    clicarNoBotaoEstouComSorte() {
            cy.get(googleElements.botaoEstouComSorte()).click();
        }
}

export default GooglePage;