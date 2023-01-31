// tristanjacobs@gmail.com
// password

describe('Jungle User sign-up and login', () => {
  
  beforeEach(() => {
    cy.visit("/");
  });

  xit("should visit root", () => {
    cy.visit("/");
  });

  xit("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  xit("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("signup user", () => {
    // click on signup button
    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(3) > .nav-link').click();
    cy.get('#user_name').type("Mr; Popo");
    cy.get('#user_email').type("mister@popo.com");
    cy.get('#user_password').type("misterpopo");
    cy.get('#user_password_confirmation').type("misterpopo");
    cy.get('[type="submit"]').click();
  })

  it("Login user", () => {
    cy.get('#navbarSupportedContent > :nth-child(2) > :nth-child(2) > .nav-link').click();
    cy.get('#email').type("mister@popo.com");
    cy.get('#password').type("misterpopo");
    cy.get('[type="submit"]').click();
    cy.get('#navbarSupportedContent > :nth-child(2)').contains("Signed in as Mr; Popo");
  });
  

});