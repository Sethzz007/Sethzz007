
---

# 🛡️ Sistema Anti-Cheat para Roblox

Um sistema modular e adaptável para detectar e bloquear exploits em jogos Roblox. Focado em performance, clareza e fácil personalização.

---

## 🚀 Recursos

- **Detecção de Speed Hack (velocidade)**
- **Detecção de Jump Hack (pulo)**
- **Detecção e prevenção de Fly Hack (voar)**
- **Bloqueio de abuso de RemoteEvents (ex: GiveCoins)**
- **Sistema de avisos antes do kick**
- **Configuração fácil dos limites de tolerância**
- **Limpeza automática de dados quando o jogador sai**

---

## 🧩 Estrutura do Projeto

- `AntiCheatModule` (ModuleScript): lógica central e limites configuráveis
- `AntiCheatServer` (Script): faz checagens, kicks e proteção dos RemoteEvents
- RemoteEvent protegido no `ReplicatedStorage` (exemplo: `GiveCoins`)

---

## 🛠️ Como Usar

1. **No ServerScriptService:**
   - Crie um ModuleScript chamado `AntiCheatModule`
   - Crie um Script chamado `AntiCheatServer`

2. **No ReplicatedStorage:**
   - Crie um RemoteEvent chamado `GiveCoins`

3. **Configure os limites no módulo:**
   ```lua
   local SPEED_TOLERANCE = 2      -- Tolerância extra de velocidade
   local JUMP_TOLERANCE = 5       -- Tolerância extra de pulo
   local CHECK_INTERVAL = 1       -- Intervalo de checagem em segundos
   local REMOTE_MAX_AMOUNT = 100  -- Máximo permitido por RemoteEvent
   local REMOTE_COOLDOWN = 2      -- Tempo mínimo entre usos do Remote
   ```

4. **(Opcional) Ajuste o sistema de avisos:**
   - Por padrão, o jogador é kickado após 2 advertências.
   - Para mudar, edite a função `warnAndKick` no `AntiCheatServer`.

---

## 🧪 Exemplo de Detecção

```lua
if humanoid.WalkSpeed > maxSpeed + SPEED_TOLERANCE then
    warnAndKick(player, "Speed hack detectado.")
end
```

---

## ⚙️ Personalização Avançada

- **Adicionar novas detecções:**  
  Basta criar novas funções no `AntiCheatModule` e chamá-las no loop de checagem do `AntiCheatServer`.
- **Proteger outros RemoteEvents:**  
  Copie a lógica de## 🛡️ Boas Práticas

- Sempre valide os dados recebidos do cliente.
- Nunca confie em RemoteEvents sem validação.
- Ajuste as tolerâncias para evitar falsos positivos causados por lag.

---

## 📄 Licença

MIT. Use, modifique e distribua à vontade.

---

## 📊 Fluxograma

```
Jogador entra
    ↓
AntiCheat monitora periodicamente
    ↓
Detecta comportamento suspeito?
    → Não: continua monitorando
    → Sim: adverte e, se necessário, kicka o jogador
    ↓
Limpa dados ao sair do jogo
```