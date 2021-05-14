/// <reference types="Cypress" />

const { clearAllVariables } = require("./BackendSteps");

const {
    Before,
    After,
  } = require("cypress-cucumber-preprocessor/steps");

   
  // this will get called before each scenario
  
    Before(() => {
      console.log('antes de cada cenário')

      //Limpar todas as variáveis de contexto a serem usadas nos testes
      //criar funcao aqui para ser chamada sempre
      clearAllVariables();
  });

  After(() => {
    cy.screenshot();
    console.log('depois de cada cenário')
  });