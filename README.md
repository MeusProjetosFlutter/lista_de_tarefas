# Lista de Tarefas (To-Do List)

Aplicativo mobile desenvolvido utilizando **Flutter e Dart**, com o objetivo de permitir que o usuário organize suas tarefas diárias de maneira simples e prática.

O projeto utiliza armazenamento local com **SharedPreferences**, permitindo que as tarefas permaneçam salvas mesmo após o encerramento da aplicação.

# Funcionalidades

- **Adicionar tarefas:** permite cadastrar novas tarefas através de um campo de texto.
- **Listagem de tarefas:** exibe todas as tarefas cadastradas.
- **Remover tarefas:** permite excluir individualmente uma tarefa.
- **Desfazer exclusão:** disponibiliza a opção de recuperar uma tarefa removida através de um SnackBar.
- **Limpar todas as tarefas:** permite excluir todas as tarefas mediante confirmação.
- **Restaurar tarefas:** possibilita recuperar a lista de tarefas armazenada em memória.
- **Contador de tarefas:** exibe a quantidade de tarefas pendentes.
- **Persistência de dados:** mantém as tarefas salvas localmente utilizando SharedPreferences.
- **Validação de entrada:** impede o cadastro de tarefas sem título.

# Tecnologias utilizadas

- **Flutter:** framework utilizado para o desenvolvimento da interface mobile.
- **Dart:** linguagem de programação utilizada na implementação da aplicação.
- **SharedPreferences:** armazenamento local dos dados da aplicação.

# Conceitos praticados

- Gerenciamento de estado com `StatefulWidget` e `setState()`.
- Ciclo de vida dos widgets com `initState()`.
- Manipulação de listas utilizando `List<T>`.
- Criação e manipulação de objetos através de classes e modelos (`Todo`).
- Separação de responsabilidades utilizando o padrão Repository.
- Persistência de dados com SharedPreferences.
- Manipulação de eventos e callbacks.
- Implementação de operações de adição, remoção e recuperação de dados.
- Utilização de `TextEditingController` para captura de informações.
- Exibição de mensagens interativas com `SnackBar` e `SnackBarAction`.
- Confirmação de operações utilizando `AlertDialog`.
- Manipulação de datas com `DateTime.now()`.
- Construção de interfaces utilizando `Column`, `Row`, `Expanded`, `Flexible` e `ListView`.

# Organização do projeto

O projeto utiliza uma estrutura organizada em pastas para separar a interface, os modelos de dados e a lógica de persistência.

```text
lib/
│
├── models/
│   └── todo.dart
│
├── repositories/
│   └── todo_repository.dart
│
├── widgets/
│   └── todo_item_list.dart
│
└── main.dart
```

**Responsabilidades:**

- `models/`: contém a classe responsável pela representação dos dados de uma tarefa.
- `repositories/`: responsável pelo armazenamento e recuperação das tarefas.
- `widgets/`: contém os componentes reutilizáveis da interface.
- `main.dart`: ponto de entrada da aplicação.

# Persistência de dados

A aplicação utiliza o SharedPreferences para armazenar localmente a lista de tarefas.

Através da classe `TodoRepository`, as operações de armazenamento e recuperação são separadas da interface, facilitando a organização e manutenção do código.

# Interface

<img width="1080" height="2400" alt="Screenshot_1794274646" src="https://github.com/user-attachments/assets/adccb34c-4deb-4ef1-b984-2518a3d4af79" />
<img width="1080" height="2400" alt="Screenshot_1794274708" src="https://github.com/user-attachments/assets/27c30a76-a5ab-4117-a90f-729709e87486" />
<img width="1080" height="2400" alt="Screenshot_1794275752" src="https://github.com/user-attachments/assets/be7579c9-e273-47e2-b4ba-964cd5c007fe" />
<img width="1080" height="2400" alt="Screenshot_1794275767" src="https://github.com/user-attachments/assets/dddc8da9-6041-45d6-95d0-f15854bacf25" />
<img width="1080" height="2400" alt="Screenshot_1794277043" src="https://github.com/user-attachments/assets/468c183e-e41c-44ab-91a0-5f525cd41753" />
<img width="1080" height="2400" alt="Screenshot_1794277071" src="https://github.com/user-attachments/assets/62b42055-cd7d-423a-a548-fccd3b2dcfb9" />

# Como executar o projeto

1. Clone este repositório:

```bash
git clone https://github.com/SEU-USUARIO/NOME-DO-REPOSITORIO.git
```

2. Entre na pasta do projeto:

```bash
cd NOME-DO-REPOSITORIO
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute a aplicação:

```bash
flutter run
```

# Desenvolvedor

Projeto desenvolvido como parte dos meus estudos em **Desenvolvimento Mobile com Flutter e Dart**, com foco em persistência de dados, organização de código e desenvolvimento de funcionalidades interativas.


