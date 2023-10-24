/// <reference types="cypress"/>

describe("Cenário de Testes para GlobalSQA", () => {

  it.skip("Caso de Teste para Registro de Usuários", () => {

    cy.visit("https://globalsqa.com/angularJs-protractor/registration-login-example/#/register")
    cy.get('#firstName').type("darry")
    cy.get('#Text1').type("larry")
    cy.get('#username').type("berry")
    cy.get('#password').type("jerry")
    cy.get('.btn-primary').click()
    cy.get('.ng-binding').should('contain.text', 'Registration successful')
  })

  it.skip("Caso de Teste para Login Invalido", () => {

    cy.visit("https://globalsqa.com/angularJs-protractor/registration-login-example/#/login")
    cy.get('#username').type("abc")
    cy.get("#password").type("123")
    cy.get('.btn-primary').click()
    cy.get('.ng-binding').should('have.text', 'Username or password is incorrect')

  })

  it("Caso de Teste para Login Válido", () => {

    let userInfo = register()
    cy.visit("https://globalsqa.com/angularJs-protractor/registration-login-example/#/login")
    cy.get('#username').type(userInfo['username'])
    cy.get('#password').type(userInfo['password'])
    cy.get('.btn-primary').click()
    cy.get('h1.ng-binding').should('contain.text', 'Hi')

  })

  function register(){ 
    let userInfo = {}
    userInfo['firstName'] = generateString()
    userInfo['lastName'] = generateString()
    userInfo['username'] = generateString()
    userInfo['password'] = generateString()

    cy.visit("https://globalsqa.com/angularJs-protractor/registration-login-example/#/login")
    cy.get('.btn-link').click()

    cy.get('#firstName').type(userInfo['firstName'])
    cy.get('#Text1').type(userInfo['lastName'])
    cy.get('#username').type(userInfo['username'])
    cy.get('#password').type(userInfo['password'])
    cy.get('.btn-primary').click()
    cy.get('.ng-binding').should('have.text', 'Registration successful')

    return userInfo
  }

  // Generate string
  function generateString() {
    let date = new Date()

    let hours = date.getHours().toString()
    let minutes = date.getMinutes().toString()
    let seconds = date.getSeconds().toString()
    let milliseconds = date.getMilliseconds().toString()

    return hours + minutes + seconds + milliseconds
  }



})