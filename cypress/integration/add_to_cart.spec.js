describe('home page cart features', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })
  it('loads home page', () => {
  })
  it("There are working Add buttons on the page", () => {
    cy.get("[href='/cart']").contains("My Cart (0)");
    cy.get("button").contains("Add").click({force: true});
    cy.get("[href='/cart']").contains("My Cart (1)");
  });
})
