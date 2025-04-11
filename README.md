
#  Banco de Dados de Biblioteca - SQL Server

##  1. Entidades do Banco de Dados

### a) Livros
- Representa os livros disponíveis na biblioteca.
- Cada livro tem um **ID único** (`IdLivro`), além de título, autor, ano de publicação e gênero.

### b) Usuários
- Representa os usuários (leitores) cadastrados na biblioteca.
- Cada usuário tem um **ID único** (`IdUsuario`), nome, e-mail e a data em que foi cadastrado.

### c) Empréstimos
- Representa o **registro de empréstimos de livros** feitos pelos usuários.
- Cada empréstimo tem um **ID único** (`IdEmprestimo`) e está relacionado a:
  - Um usuário (`IdUsuario`)
  - Um livro (`IdLivro`)
  - Data do empréstimo e data da devolução (se devolvido)

---

## 🔗 2. Relacionamentos

### Livros ↔ Empréstimos
- **Relação 1:N** – Um livro pode estar em vários empréstimos.
- `Emprestimos.IdLivro` é uma chave estrangeira que aponta para `Livros.IdLivro`.

### Usuários ↔ Empréstimos
- **Relação 1:N** – Um usuário pode fazer vários empréstimos.
- `Emprestimos.IdUsuario` é uma chave estrangeira que aponta para `Usuarios.IdUsuario`.

---

## ⚙️ 3. Ações Possíveis no Sistema

| Ação                                     | Tabelas Envolvidas         | Descrição |
|------------------------------------------|-----------------------------|-----------|
| Cadastrar um novo livro                  | `Livros`                    | Insere dados sobre novos títulos. |
| Cadastrar um novo usuário                | `Usuarios`                  | Adiciona um novo leitor ao sistema. |
| Registrar um empréstimo                  | `Emprestimos`, `Livros`, `Usuarios` | Salva qual livro foi emprestado, para quem e quando. |
| Consultar livros disponíveis             | `Livros`, `Emprestimos`     | Verificar livros que não estão emprestados. |
| Listar todos os empréstimos              | `Emprestimos`, com JOINs    | Mostra quem pegou qual livro e quando. |
| Ver histórico de empréstimos de um usuário | `Emprestimos`, `Usuarios`, `Livros` | Mostra todos os empréstimos feitos por um determinado leitor. |
| Devolver um livro (atualizar data)       | `Emprestimos`               | Preencher o campo `DataDevolucao` de um empréstimo existente. |

---

##  4. Modelo ER Simplificado

```
Usuarios (1) ────────< (N) Emprestimos (N) >──────── (1) Livros
```

- Um usuário pode fazer muitos empréstimos.
- Um livro pode estar em muitos empréstimos.
- Cada empréstimo está relacionado a **um** usuário e **um** livro.

