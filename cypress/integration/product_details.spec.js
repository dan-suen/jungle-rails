describe('home page features', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })
  it('loads home page', () => {
  })
  it("navigates to products page by click", () => {
    cy.contains("Scented Blade").click();

    cy.contains("The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.");
    cy.get(".quantity").contains("$24.99");
  });
})

