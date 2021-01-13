/// <reference types="Cypress" />

const {
    Before,
    After,
  } = require("cypress-cucumber-preprocessor/steps");
   
  // this will get called before each scenario
  
    Before(() => {
    console.log('antes de cada cenário')
  });

  After(() => {
    cy.screenshot();
    console.log('depois de cada cenário')
  });