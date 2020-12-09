const {
    Before,
    After,
  } = require("cypress-cucumber-preprocessor/steps");
   
  // this will get called before each scenario
  
    Before(() => {
    console.log('antes de cada cenário')
  });

  After(() => {
    console.log('depois de cada cenário')
  });