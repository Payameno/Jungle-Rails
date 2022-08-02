it('visits base url', () => {
  cy.visit('http://localhost:3000')
  cy.contains('h1', 'The Jungle')
})
it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
})
it("There is 2 products on the page", () => {
  cy.get(".products article").should("have.length", 2);
});