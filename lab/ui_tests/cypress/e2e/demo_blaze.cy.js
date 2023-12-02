describe('teste de UI em DemoBlaze.com', () => {

  it('add product to cart', () => {
    cy.visit('https://www.demoblaze.com/index.html')
    register_and_login()
    cy.wait(2000)

    cy.get(':nth-child(5) > .card > .card-block > .card-title > .hrefch').click()
    cy.get('.name').should('contain.text', 'Iphone')

    cy.get('.col-sm-12 > .btn').click()
    cy.wait(500)

    cy.get('#cartur').click()
    cy.wait(2000)
    cy.get('.success > td').should('contain.text', 'Iphone')
  })

  it('verifiy if the correct product is selected', () => {
    cy.visit('https://www.demoblaze.com/index.html')
    cy.get(':nth-child(5) > .card > .card-block > .card-title > .hrefch').click()
    cy.get('.name').should('contain.text', 'Iphone')
  })

  it('verify if the app blocks not registered users to log in', () => {
    cy.visit('https://www.demoblaze.com/index.html')
    cy.get('#login2').click()
    cy.wait(300)
    cy.get('#loginusername').type("THIS USERNAME DOESN'T EXIST!")
    cy.get('#loginpassword').type("THIS PASSWORD DOESN'T EXIST!")
    cy.get('#logInModal > .modal-dialog > .modal-content > .modal-footer > .btn-primary').click()

    cy.on('window:alert', (alertText) => {
      expect(alertText).to.contain('User does not exist.');
    });

  })


  function register_and_login(){ 
    let userInfo = generateString()
    cy.get('#signin2').click()
    cy.wait(1000)

    cy.get('#sign-username').type(userInfo)
    cy.get('#sign-password').type(userInfo)

    cy.get('#signInModal > .modal-dialog > .modal-content > .modal-footer > .btn-primary').click()
    
    cy.wait(500)
    
    cy.get('#login2').click()
    cy.wait(1000)

    cy.get('#loginusername').type(userInfo, { delay: 100 })
    cy.get('#loginpassword').type(userInfo, { delay: 100 })

    cy.get('#logInModal > .modal-dialog > .modal-content > .modal-footer > .btn-primary').click()

    cy.wait(2000)
    cy.get('#nameofuser').should('contain.text', 'Welcome')
  }

  // Generate string
  function generateString() {
    let date = new Date()

    let hours = date.getHours().toString()
    let minutes = date.getMinutes().toString()
    let seconds = date.getSeconds().toString()
    let milliseconds = date.getMilliseconds().toString()

    return seconds + milliseconds + "68468135146878"
  }

})