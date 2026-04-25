# Fast Tracker App

Projeto Flutter criado para completar um desafio de programação rápido com o prazo de 3 a 4 dias corridos.

Em relação à arquitetura e injeção de dependências, foi implementado seguindo os preceitos da clean architecture com o uso de ferramentas nativas do Flutter para gerenciamento de estado, juntamente com a biblioteca flutter_bloc.

Para a injeção de dependências, foi utilizada a biblioteca flutter_modular em conjunto com a biblioteca DIO para requisições HTTP/HTTPS e, por último, a biblioteca Mockito para criar classes falsas voltadas para testes unitários.

## Como executar o projeto?

Basta apenas rodar o comando abaixo com um celular plugado ao computador ou com um emulador de dispositivos mobile aberto.

```flutter run```

Serão fornecidas também um arquivo de instalação APK para facilitar a avaliação da aplicação sem a necessidade de ter um ambiente de desenvolvimento preparado para roda-lo.

## Como executar os testes unitarios?

Primeiramente, é necessário gerar os mocks necessários para algumas dependências utilizadas pelo
aplicativo.

O seguinte comando deve ser executado:

flutter pub run build_runner build --delete-conflicting-outputs

Por fim, basta apenas executar o comando:

```flutter test```

Dessa forma, os testes implementados serão executados.
