# Data Cleaning SQL

Projeto de limpeza de dados em SQL, simulando uma base de clientes vinda de migração de sistema, cheia de problema real: duplicata, espaço sobrando, campo vazio disfarçado e data em formato diferente em cada linha.

*(EN) SQL data cleaning project simulating a customer database from a legacy system migration — duplicates, inconsistent formatting, fake nulls and mixed date formats. All fixed using raw SQL.*

---

## Contexto

Imaginei o cenário de uma cooperativa financeira que importou uma base antiga de clientes pra um sistema novo. Esse tipo de base quase sempre vem suja: nomes com capitalização diferente, emails com espaço, telefone em formatos variados, e até cliente cadastrado duas vezes.

O objetivo foi pegar essa base bruta e deixar ela pronta pra uso real, só com SQL.

## Ferramentas

- MySQL
- VS Code (extensão Database Client)

## Estrutura dos dados

Tabela `clientes_bruto`, com os dados como vieram, sem tratamento:

| Coluna | Tipo |
|---|---|
| id_registro | INT (PK) |
| nome | VARCHAR(150) |
| email | VARCHAR(150) |
| telefone | VARCHAR(30) |
| cidade | VARCHAR(100) |
| estado | VARCHAR(20) |
| data_nascimento | VARCHAR(20) — veio como texto, formato bagunçado |

No final, os dados tratados ficam numa segunda tabela, `clientes_limpo`.

## Problemas encontrados

- Cliente duplicado (mesmo email, nome escrito diferente)
- Espaço sobrando no início, fim e até no meio do texto
- Capitalização inconsistente (`DF` vs `df`, `JOÃO` vs `joão`)
- Campo vazio disfarçado de `N/A` em vez de nulo de verdade
- Data de nascimento em 4 formatos diferentes na mesma coluna

## O que fiz

1. Rodei consultas de diagnóstico pra confirmar e medir cada problema antes de mexer em qualquer coisa
2. Padronizei texto com `TRIM`, `UPPER`/`LOWER` e `REPLACE` (pra espaço duplo no meio)
3. Troquei `N/A` e campo vazio por `NULL` de verdade
4. Converti as datas pra um formato único, usando `STR_TO_DATE` com `CASE` pra tratar cada formato
5. Identifiquei as duplicatas comparando email e removi o registro menos completo
6. Criei a tabela final `clientes_limpo` só com o dado já tratado

## Arquivos

- `sql/01_criar_tabelas.sql`
- `sql/02_inserir_dados_brutos.sql`
- `sql/03_diagnostico.sql`
- `sql/04_limpeza.sql`
- `sql/05_tabela_final.sql`

## O que aprendi

Foi o primeiro projeto onde errei de verdade (rodei um `DELETE` sem `WHERE` por acidente e apaguei a tabela inteira). Aprendi na prática por que todo mundo fala tanto em ter cuidado com isso, e também a importância de guardar os scripts separados — foi o que me permitiu recriar os dados rapidinho depois do erro.

Também entendi que limpar dado não é só rodar função — é primeiro diagnosticar o problema, confirmar com os próprios olhos, e só depois corrigir.
