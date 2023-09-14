
# Gamificacao_dm2023-2 - App de Controle para Reserva de Hotel

Sistema de controle de registro de reserva de quartos para hotel. Conta com registro de funcionário, hospede, quarto e reserva. Projeto desenvolvido em Flutter usando SQFlite e para a persistência dos dados SharedPreferences para armazenar configurações do usuário.

## Classes básicas:

- Quarto: Representa os quartos do hotel. Contém atributos como número do quarto, tipo (simples, luxo, suíte), status (ocupado, disponível) e preço por noite.
- Hóspede: Representa os clientes do hotel. Contém atributos como nome, sobrenome, documento de identificação e contato.
- Funcionário: Representa os funcionários do hotel. Contém atributos como nome, cargo, salário e data de admissão.
- Reserva: Representa as reservas feitas no hotel. Contém atributos como data de entrada, data de saída, hóspede responsável e quarto reservado.
- Serviço Adicional: Representa serviços extras que podem ser contratados, como café da manhã, spa ou serviço de quarto. Contém atributos como descrição e preço.


## Tecnologias Utilizadas

- Flutter
- SQLite

## Instalação

1. Clone o repositório: `git clone <nome-repositorio>`
2. Abra o projeto no editor de sua preferência
3. Instale as dependências do projeto: `flutter pub get` 
5. Execute o aplicativo em um dispositivo físico conectado ao computador ou em um emulador de smartphone (android-emulator, genymotion..)

## Contribuidores
- Eduardo Gasparin <https://github.com/egasparin>
- Rodrigo Ribeiro  <https://github.com/rodrignucleo>
