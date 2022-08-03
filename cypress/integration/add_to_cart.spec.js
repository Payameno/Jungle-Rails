it('Clicks on "Add" button and increases cart count by one', () => {
  cy.visit('http://localhost:3000')
  cy.get('.button_to #add_button').first().click({force: true})
  cy.get('.end-0').should('contain', '(1)')
})
