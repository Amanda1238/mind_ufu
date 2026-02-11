#  Mind UFU - Plataforma de Estudos

Este é o projeto desenvolvido para a disciplina de **Programação para WEB I**. O sistema é uma plataforma web para gerenciamento de estudos, permitindo criar comunidades, resolver quizzes, organizar materiais e anotações.

## 🚀 Tecnologias Utilizadas
* **Frontend:** HTML5, CSS3, JavaScript (jQuery), Bootstrap 5.
* **Backend:** PHP (Nativo).
* **Banco de Dados:** MySQL.
* **Bibliotecas:** `jsPDF` (para gerar relatórios), `Bootstrap Icons`.

---

## 🛠️ Como Rodar o Projeto (Passo a Passo)

### 1. Pré-requisitos
Você precisa ter um servidor local instalado. Recomendamos o **AMPPS**, mas funciona no XAMPP ou WAMP.

### 2. Configuração dos Arquivos
1.  Baixe este projeto.
2.  Copie a pasta inteira do projeto para dentro da pasta pública do seu servidor.
    * **No AMPPS:** `C:\Ampps\www\mind_ufu`
    * **No XAMPP:** `C:\xampp\htdocs\mind_ufu`
3.  ⚠️ **Importante:** O nome da pasta deve ser exatamente **`mind_ufu`**.

### 3. Configuração do Banco de Dados
O sistema precisa do banco de dados para funcionar. Este script abaixo apaga qualquer versão antiga e cria uma nova com dados de teste.

1.  Abra o phpMyAdmin ou o WorkBench .
2.  Crie um novo chamado ``mindufu``.
3. Abra o arquivo `mindufu.sql` ou copie e cole o conteudo do arquivo num novo de mesmo nome.

### 4. Configuração de Conexão (db.php)
Para que o site consiga conversar com o banco que você acabou de criar, verifique o arquivo de conexão.

Abra o arquivo: `mind_ufu/php/db.php`

Certifique-se de que o código está assim (atenção à senha):

```php
<?php
$host = 'localhost';
$user = 'root';

$pass = 'mysql'; 
$db   = 'mind_ufu';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}
?>
```
## 🖥️ Como Usar

1.  Certifique-se de que o Apache e o MySQL estão rodando .
2.  Abra seu navegador .
3.  Acesse o link:
     **`http://localhost/mind_ufu/index.html`** ( ou abra o arquivo da propria pasta no explorador de arquivos)

### Funcionalidades do Sistema:

* **⚡ Dashboard:**
    * Tela inicial com visão geral, atalhos rápidos e resumo de pendências do estudante.
* **👥 Comunidades:**
    * **Criar:** Crie novos grupos de estudo (ex: "Cálculo I", "Algoritmos").
    * **Entrar:** Entre em grupos existentes usando o código da turma.
    * **Interagir:** Acesse o mural e veja os materiais compartilhados.
* **📓 Caderno Digital:**
    * Sistema hierárquico de anotações: *Disciplina > Pasta > Página*.
    * Auto-save: Tudo é salvo automaticamente no banco de dados enquanto você digita.
    * Dados já inclusos de exemplo (Disciplina "Cálculo I").
* **📝 Quiz (Simulados):**
    * **Responder:** Realize provas com navegação entre questões.
    * **Revisão:** Veja quais questões acertou/errou ao finalizar.
    * **Favoritos:** Salve quizzes para fazer depois (aparecem na aba lateral "Quiz").
    * **PDF:** Baixe a prova completa com gabarito automático ao final.
* **🎴 Flashcards & 📅 Calendário:**
    * Ferramentas visuais para revisão de conteúdo e organização de datas de entrega.

---

## 📂 Estrutura de Pastas

Para entender onde estão os códigos principais ( esta um pouco bagunçado, podemos melhorar):


```text
mind_ufu/
├── assets/
│   ├── css/
│   │   └── style-global.css     # Estilos visuais de todo o site
│   └── js/
│       └── sidebar.js           # Script da barra lateral
├── php/                         # Back-end (API e Banco)
│   ├── api_comunidades.php      # Gerencia grupos e quizzes
│   ├── buscar_hierarquia.php    # Carrega a árvore do caderno
│   ├── buscar_pagina.php        # Carrega o conteúdo de uma nota
│   ├── criar_item.php           # Cria pastas/páginas no caderno
│   ├── db.php                   # Conexão com o MySQL
│   ├── salvar_pagina.php        # Salva o texto do caderno
│   └── ... (outros scripts auxiliares)
├── caderno.html                 # Caderno de anotações
├── calendario.html              # Agenda
├── comunidades.html             # Lista de grupos de estudo
├── dashboard.html               # Tela inicial
├── editor_quiz.html             # Criação de provas
├── flashcards.html              # Cartões de memória
├── index.html                   # Redirecionamento inicial
├── meus_quizzes.html            # Lista de favoritos
├── quiz.html                    # Atalho da sidebar
├── realizar_quiz.html           # Tela de resolução de prova
└── ver_comunidade.html          # Detalhes de um grupo