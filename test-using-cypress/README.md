# Teste do site Mercado Libre usando Cypress

## Instalação do cypress

```bash
cd ./tests
npm install cypress --save-dev
```

## Instalação do mochawesome (para gerar relatórios)

```bash
npm install cypress-mochawesome-reporter
```

## Para rodar os testes

```bash
./node_modules/.bin/cypress run --spec 'cypress/e2e/**/'
```