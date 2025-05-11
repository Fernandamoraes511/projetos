
# 📄 README - Script SQL da Empresa

## 📌 Visão Geral

Este script SQL cria um esquema chamado `Empresa` em um banco de dados PostgreSQL. Ele define duas tabelas principais — `Funcionario` e `Departamento` — e realiza operações básicas de inserção, atualização e exclusão de dados.

## 🏗️ Estrutura do Banco de Dados

### Schema
- **Empresa**: Organiza as tabelas funcionais da empresa.

### Tabelas

#### 🧑‍💼 Funcionario
Armazena informações sobre os funcionários da empresa.

| Coluna           | Tipo        | Restrições                                     |
|------------------|-------------|------------------------------------------------|
| `cpf`            | CHAR(11)    | PRIMARY KEY                                    |
| `nome`           | VARCHAR(100)| NOT NULL                                       |
| `salario`        | NUMERIC     | DEFAULT 2000, CHECK (salario >= 1000)          |
| `data_nascimento`| DATE        | —                                              |
| `email`          | VARCHAR(100)| —                                              |

#### 🏢 Departamento
Registra os departamentos da empresa e seus respectivos gerentes.

| Coluna   | Tipo       | Restrições                                         |
|----------|------------|----------------------------------------------------|
| `id`     | SERIAL     | PRIMARY KEY                                       |
| `nome`   | VARCHAR(50)| UNIQUE                                            |
| `gerente`| CHAR(11)   | FOREIGN KEY → `Funcionario(cpf)`                  |

## 🔄 Operações Realizadas

- **INSERT**: Adiciona dados iniciais às tabelas `Funcionario` e `Departamento`.
- **UPDATE**: Atualiza o salário dos funcionários que ganham 2000 para 2500.
- **DELETE**: Remove um funcionário com CPF `12345678900`, se existir.

## ✅ Requisitos

- PostgreSQL 9.0+
- Permissão para criar schemas e tabelas

## 🚀 Como Usar

1. Conecte-se ao seu banco PostgreSQL.
2. Execute o script com um cliente SQL ou via terminal:
   ```bash
   psql -U seu_usuario -d seu_banco -f PostgreSQL.sql
   ```
