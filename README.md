# TrabalhoFuncionalScheme
# Scheme: Uma Visão Geral

## Origem da Linguagem Scheme
- Scheme foi criada em 1975 por Gerald Jay Sussman e Guy L. Steele Jr.
- Ela se originou a partir da linguagem Lisp.

## Paradigmas de Programação
- Scheme é uma linguagem multiparadigma que suporta programação funcional e procedural.

## Objetivo de Design
- O principal objetivo ao criar Scheme foi oferecer uma linguagem de programação simples e elegante, mantendo a potência do Lisp.

## Ambiente de Desenvolvimento
- O interpretador Racket é amplamente utilizado para desenvolver em Scheme.
- O Racket evoluiu a partir da implementação anterior conhecida como "PLT Scheme".
- Importante notar que o PLT Scheme não foi descontinuado; ele se transformou em uma plataforma mais abrangente chamada Racket.

## Ambiente de Desenvolvimento para Scheme

### Instalação do Racket

Certifique-se de ter o Racket instalado: https://racket-lang.org/, pois ele fornece um interpretador para a linguagem Scheme. Você pode optar por utilizar a IDE Dr. Racket se preferir uma interface gráfica.

### Configuração no VS Code

Para trabalhar com Scheme no Visual Studio Code, siga as instruções abaixo:

1. **Configuração da Variável de Ambiente:**
   - Certifique-se de que a variável de ambiente `PATH` contenha o caminho para a instalação do Racket.

2. **Instalação da Extensão Code Runner:**
   - Instale a extensão Code Runner no Visual Studio Code.

3. **Configuração do Executor Map:**
   - Vá para "Settings" >> "Extensions" >> "Run Code Configuration" >> "Executor Map".
   - Clique em "Edit in settings.json" e adicione o seguinte trecho dentro de "code-runner.executorMap":
     ```json
     "scheme": "racket"
     ```

4. **Configuração do Executor Map por Extensão de Arquivo:**
   - Vá para "Executor Map By File Extension".
   - Clique em "Edit in settings.json" e adicione o seguinte trecho dentro de "code-runner.executorMapByFileExtension":
     ```json
     ".scm": "racket",
     ```

Agora, ao utilizar o VS Code para escrever código Scheme, o Code Runner estará configurado para executar corretamente os arquivos com extensão `.scm` e `.scheme`. Certifique-se de inserir o cabeçalho `#lang scheme` no início do seu código para indicar que está usando a linguagem Scheme.

