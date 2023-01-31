describe('Jungle Product Details Page', () => {
  
  beforeEach(() => {
    cy.visit("/");
  });

  // test that users can navigate from the home page to the product details page
  it("Shows product/show", () => {
    cy.get(".products article").first().click();
    cy.get('.btn').contains("Add");
  });
  

});