it('visits base url', () => {
  cy.visit('http://localhost:3000')
  cy.contains('h1', 'The Jungle')
})
it('Clicks on a product and views the product page', () => {
  cy.visit('http://localhost:3000')
  cy.contains('Giant Tea').click()
  cy.contains('h1', 'Giant Tea')
})
