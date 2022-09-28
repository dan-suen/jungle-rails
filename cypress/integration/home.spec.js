describe('home page features', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })
  it('loads home page', () => {
  })
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})

