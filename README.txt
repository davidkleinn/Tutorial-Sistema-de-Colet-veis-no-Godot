# 🪙 Godot Coin Collector: Pontuação, Combos e Game Feel

![Godot Engine](https://img.shields.io/badge/Godot_4.2.1-Blue?logo=godot-engine&logoColor=white)
![GDScript](https://img.shields.io/badge/GDScript-Standard-green)
![Status](https://img.shields.io/badge/Status-Concluído-success)

## 📌 Sobre o Projeto
Este protótipo foi desenvolvido como parte de um estudo prático sobre mecânicas de interface e feedback visual na **Godot Engine 4**. O foco do projeto não é apenas a coleta de itens, mas a implementação de sistemas subjacentes robustos, como gerenciamento de estado temporal (combos) e comunicação desacoplada entre a lógica do jogo e a interface de usuário (HUD).

🎥 **[Assista ao vídeo de demonstração da mecânica aqui] (COLOQUE O LINK DO SEU VÍDEO AQUI)**

## ⚙️ Destaques Técnicos e Arquitetura

O projeto foi construído priorizando boas práticas de programação orientada a objetos e separação de responsabilidades:

* **Sistema de Combo Independente de Frame Rate:** A lógica de decaimento do tempo de combo utiliza a variável `delta` do loop `_process`, garantindo que a janela de 3 segundos seja matematicamente precisa em qualquer hardware.
* **Comunicação Orientada a Eventos (Signals):** Os objetos coletáveis (`Area2D`) utilizam sinais (`_on_body_entered`) para notificar o jogador sobre a colisão, evitando o acoplamento forte entre os nós da cena.
* **Desacoplamento de UI:** O *Heads-Up Display* (HUD) foi construído utilizando um `CanvasLayer`, garantindo que a renderização da interface gráfica seja executada em uma camada independente da câmera e da física do mundo 2D.
* **Feedback Visual Procedural (Tweens):** Em vez de depender exclusivamente de animações em *spritesheets*, o feedback de coleta da moeda (flutuação e *fade out*) foi programado matematicamente utilizando a classe `Tween`, manipulando as propriedades de posição e canal *Alpha* de forma assíncrona.

## 🎮 Mecânicas Implementadas
1. **Física e Movimentação:** Controle de personagem 2D com gravidade, pulo e detecção de solo.
2. **Sistema de Pontuação (Score):** Atualização dinâmica via interface gráfica.
3. **Multiplicador de Combo:** Janela de tempo de 3 segundos entre coletas para aumentar o multiplicador de pontos. Esgotado o tempo, o estado retorna ao valor base (x1).
4. **Juice & Game Feel:** Animações responsivas baseadas no estado do jogador (Idle, Run, Jump) e interpolações de saída para os coletáveis.

## 🚀 Como Executar Localmente

1. Certifique-se de ter a [Godot Engine 4.2+](https://godotengine.org/download) instalada na sua máquina.
2. Clone este repositório:
   ```bash
   git clone [https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git](https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git)
