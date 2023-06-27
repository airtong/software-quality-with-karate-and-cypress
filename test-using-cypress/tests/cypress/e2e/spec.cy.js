describe('Test cases of mercadolibre.com.ar', () => {
  it('Searching successfully', () => {
    cy.visit('https://www.mercadolibre.com.ar/')
    cy.get('#cb1-edit').type('iphone 14')
    cy.get('.nav-icon-search').click()
    cy.get('.ui-search-search-result__quantity-results').should('exist')
  }),

  it('Searching failed', () => {
    cy.visit('https://www.mercadolibre.com.ar/')
    cy.get('#cb1-edit').type('54af4as')
    cy.get('.nav-icon-search').click()
    cy.get('.ui-search-rescue__title').should('contain.text', 'No hay publicaciones que coincidan con tu búsqueda')
  }),

  it('Search, Open, View (Correct Product Name)', () => {
    cy.visit('https://www.mercadolibre.com.ar/')
    cy.get('#cb1-edit').type('iphone 14')
    cy.get('.nav-icon-search').click()
    let productTitle = cy.get(':nth-child(1) > .ui-search-result__wrapper > .andes-card > .ui-search-result__content-wrapper > .ui-search-item__group--title > .ui-search-link > .ui-search-item__title')
    let productName = ''
    productTitle.invoke('text').then((text) => {
      productName = text
    })
    cy.get(':nth-child(1) > .ui-search-result__wrapper > .andes-card > .ui-search-result__content-wrapper > .ui-search-item__group--title > .ui-search-link > .ui-search-item__title').click()
    cy.get('.ui-pdp-title').should('contain.text',productName)
  })
})