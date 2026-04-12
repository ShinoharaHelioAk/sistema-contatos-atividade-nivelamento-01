----------------------------------------------------------------
📇 Sistema de Contatos

Atividade de Nivelamento – Curso IOS (Capgemini | Proway)

📌 Descrição do Projeto

Este projeto foi desenvolvido como atividade de nivelamento, referente ao módulo Fundamentos da Linguagem Swift.

A proposta da atividade consistiu no desenvolvimento de um sistema de gerenciamento de contatos, utilizando uma interface de linha de comando (CLI), na qual o usuário interage com a aplicação digitando informações, simulando o funcionamento da interface de um terminal.

----------------------------------------------------------------
🧩 Processo de Desenvolvimento

🔹 Etapa Inicial

  Inicialmente, toda a lógica do sistema foi desenvolvida em um único arquivo (main.swift), incluindo:
  - Criação do struct Contato (classe entidade)
  - Criação do struct GerenciadorDeContatos
  - Implementação das funções de CRUD
  - Implementação da interface de linha de comando

----------------------------------------------------------------
🔹 Refatoração e Separação de Camadas

Após a conclusão da lógica principal, comecei a desmembrar as camadas do sistema em arquivos distintos, visando melhor organização e manutenibilidade:
  - Contato.swift
    - Contém o struct Contato, representando a entidade do sistema.
  - GerenciadorDeContatos.swift
    - Responsável pela lógica de gerenciamento dos contatos.
  - validacoes.swift
    - Contém as regras de consistência e validação das informações inseridas pelo usuário.
  - persistencia.swift
    - Camada considerada como persistência, onde foram separadas as operações relacionadas ao CRUD.
  - main.swift
    - Esse arquivo ficou com a parte da interação do usuário nas opções e as digitações das informações solicitadas.

----------------------------------------------------------------
🧠 Decisões de Projeto

  - Herança:
    - Não vi a necessidade de implementar o conceito de Herança nessa atividade, mas poderia ter sido criado um Protocol Pessoa, do qual o struct Contato poderia herdar.
  - Tratamento de Erros:
    - Não cheguei a implementar também um tratamento de erros (try-catch) para esse Sistema. Em vez disso, utilizei bastante o conceito das validações extensivas com guard let para garantir a integridade das entradas fornecidas pelo usuário.

----------------------------------------------------------------
