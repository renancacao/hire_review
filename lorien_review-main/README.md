# Alice Search App

## Overview

Este projeto é um aplicativo de busca desenvolvido como parte de um processo
seletivo. Utiliza uma estrutura de árvore de prefixo (trie) para operações
eficientes de busca.

## Tecnologias

- **Swift**
- **SwiftUI**
- **Árvore de Prefixo (Trie)**

## Arquitetura e Implementação

- **Frameworks**: Utilização de frameworks para maior modularização, controle sobre build e escalabilidade.
- **Módulo Common**: Um módulo exclusivo para extensões e componentes personalizados reutilizáveis, como animações, TextField customizado e cores adicionais. 
- **Injeção de Dependência**: Utilização de injeção de dependência para o serviço de busca e a estrutura de dados, garantindo flexibilidade e testabilidade.
- **Testes Unitários**: Implementação de testes unitários para garantir o funcionamento da busca e a interação entre ViewModel e suas dependências (serviço e estrutura de dados).

## Estrutura de Dados e Algoritmo

### Árvore Prefixo (Trie)

- **Eficiência**: A árvore prefixo foi escolhida por sua eficiência em operações de busca, com uma complexidade de tempo de `O(n)`, onde `n` é o tamanho do prefixo.
- **Eficiência de Espaço**: A árvore prefixo consome espaço proporcional ao número total de caracteres armazenados. Mas se existe um grande número de palavras que compartilham os mesmos prefixos, a trie pode economizar espaço comparada a outras estruturas de dados, pois o espaço utilizado para cada prefixo é um só. Em notação big O, a inserção é `O(n)` e a busca é `O(L)`, onde `L` é o tamanho da maior palavra.
- **Flexibilidade**: A árvore prefixo permite modificações futuras, como busca de sufixo em qualquer posição dentro das palavras. A implementação é abstraída por um protocolo, facilitando a mudança para outras estruturas de dados no futuro, como uma árvore de sufixo, caso necessário.
- **Array Ordenado**: A árvore prefixo é naturalmente ordenada alfabeticamente, mas se o critério é que a ordem seja a mesma que da fonte de dados, um array deve ser guardado para manter a ordenação original. A complexidade de tempo vai para `O(n+m)`, onde `n` é o tamanho do prefixo e `m` é o número de itens no array.
