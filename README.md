# SISSO — Sistema Integrado de Saúde e Segurança Ocupacional

Sistema web (HTML/CSS/JS + Node.js/Express) com banco de dados SQL Server para
gestão de SESMT: funcionários, empresas, exames, ASO, EPIs, treinamentos e
relatórios.

## Requisitos

- Node.js 18 ou superior
- SQL Server acessível pela rede

## Configuração do banco

Edite `backend/.env` (baseado em `backend/.env.example`):

```
DB_SERVER=...
DB_DATABASE=SISSO
DB_USER=...
DB_PASSWORD=...
DB_PORT=1433
PORT=3000
HOST=0.0.0.0
```

O arquivo `.env` contém credenciais e não deve ser versionado/compartilhado.

## Primeira execução

```bat
cd backend
npm install
npm run setup
```

O comando `npm run setup` cria as tabelas, os tipos de exame/ASO/EPI e os
usuários iniciais do sistema, de forma idempotente (pode ser executado de novo).

## Iniciar o sistema

Opção 1 (Windows): dê um duplo clique em `INICIAR.bat`.

Opção 2 (terminal):

```bat
cd backend
npm start
```

Acesse: http://localhost:3000 — o servidor redireciona para a tela de login.

## Acesso em outras máquinas da rede

O sistema precisa estar **rodando no computador servidor** (no seu caso,
`192.168.50.6`). Copiar a pasta para o servidor não basta: o `INICIAR.bat`
(preferencialmente via Área de Trabalho Remota ou diretamente no servidor)
deve ser executado **naquele computador** e a janela do servidor deve
permanecer aberta.

Em seguida, nas outras máquinas, acesse pelo navegador:

```
http://192.168.50.6:3000/html/TelaLogin.html
```

O console do servidor mostra a linha `Rede: http://<ip>:3000/...` com o
endereço correto. Pontos de atenção:

1. **Firewall do Windows no servidor**: libere a porta 3000. Execute
   `ABRIR-FIREWALL.bat` como Administrador (ou permita o Node.js quando o
   Windows perguntar na primeira execução).
2. **Não abra o HTML pela pasta compartilhada** (`\\192.168.50.6\...`). Nesse
   modo o navegador tenta falar com o servidor local de cada máquina. Use
   sempre o endereço `http://192.168.50.6:3000`.
3. **Banco de dados**: o `DB_SERVER` do `backend/.env` precisa estar acessível
   a partir do próprio servidor `192.168.50.6` (porta 1433 liberada na máquina
   do SQL Server).
4. Para iniciar junto com o Windows, crie uma Tarefa Agendada apontando para
   `INICIAR.bat` com a opção "Executar estando o usuário conectado ou não".

## Módulos

- **Dashboard** — indicadores, vencimentos próximos e atividades recentes.
- **Funcionários** — cadastro com empresa, setor e função.
- **Empresas** — cadastro e edição de empresas.
- **Exames** — exames ocupacionais com validade e resultado.
- **ASO** — atestados vinculados a exames, com emissão e validade.
- **EPIs** — cadastro, estoque, entregas e devoluções.
- **Treinamentos** — cadastro e emissão de lista de presença, certificado,
  conteúdo programático e ata.
- **Relatórios** — filtros por empresa/funcionário/período/status, exportação
  CSV e impressão.
- **Configurações** — área do perfil Administrator: usuários, dados da empresa,
  logs, backup em JSON e informações do sistema.

## Perfis de acesso

`Administrator`, `SESMT`, `RH` e `Médico`. Apenas `Administrator` acessa a tela
de Configurações. Usuários são gerenciados dentro do próprio sistema.
