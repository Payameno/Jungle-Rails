it('User can login successfully', () => {
  cy.visit('http://localhost:3000/login')
  cy.get('#email').type('payameno@gmail.com')
  cy.get('#password').type('payam')
  cy.contains('Submit').click()
  cy.contains('h1', 'The Jungle')
})