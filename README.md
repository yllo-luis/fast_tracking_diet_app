# Fast Tracker App 🚀

Este projeto é uma aplicação mobile desenvolvida em **Flutter**, criada como resposta a um desafio técnico com prazo de entrega acelerado (3 a 4 dias). O foco principal foi a implementação de uma arquitetura robusta, código limpo e manutenibilidade.

---

## 🛠 Arquitetura e Decisões Técnicas

O projeto foi estruturado seguindo os princípios de **Clean Architecture**, visando a separação de responsabilidades e a facilidade de testes.

### Principais escolhas:
* **Gerenciamento de Dependências:** `flutter_modular` foi utilizado para modularização e injeção de dependências, permitindo um desacoplamento eficiente.
* **Gerenciamento de Estado:** Ferramentas nativas do Flutter para gerenciar estados da aplicação.
* **Comunicação:** `dio` com `pretty_dio_logger` para requisições HTTP e debug transparente.
* **Persistência:** `sqflite` para dados locais e `shared_preferences` para configurações simples.
* **Qualidade:** Implementação de testes unitários com `mockito` para validar a lógica de negócio.

### Trade-offs & Considerações:
* **Simplicidade vs. Escalabilidade:** Optei por um equilíbrio entre a Clean Architecture e o tempo de desenvolvimento. Embora a estrutura atual suporte bem a aplicação, para um projeto de longa escala, a migração total para um padrão de estado único (ex: BLoC puro em todos os módulos) seria o próximo passo ideal.
* **Cobertura de Testes:** O projeto possui uma base sólida de **testes unitários**. Testes de widget e de integração foram priorizados para uma fase posterior de evolução do produto.

---

## 🚀 Como Executar

### Pré-requisitos
* Flutter SDK instalado e configurado.
* Dispositivo físico conectado ou emulador/simulador aberto.
* OU Dispositivo físico e arquivo de release da aplicação.

### Execução
Para rodar a aplicação:

flutter run