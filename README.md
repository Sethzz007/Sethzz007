# Roblox Anti-Cheat System

Um sistema de anti-exploit modular para jogos Roblox. Criado por **Sethzz**

## Recursos

- Detecta Speed Hack
- Detecta Jump Hack
- Detecta Fly Hack
- Bloqueia abuso de RemoteEvents
- Fácil de adaptar com base nas regras do seu jogo

## Estrutura do Projeto

- `AntiCheatModule` (ModuleScript)
- `AntiCheatServer` (Script)
- `RemoteEvent` protegido no ReplicatedStorage

## Como usar

1. Crie os arquivos no `ServerScriptService`:
   - Um `ModuleScript` chamado `AntiCheatModule`
   - Um `Script` chamado `AntiCheatServer`

2. Crie um `RemoteEvent` no `ReplicatedStorage` com nome `GiveCoins`.

3. Adapte a função `GetMaxSpeed` para refletir o level do seu jogo.

## Exemplo de Detecção

```lua
if humanoid.WalkSpeed > maxSpeed + 2 then
    player:Kick("Speed hack detectado.")
end
```

## Licença

MIT. Pode usar, modificar e distribuir livremente. Agradeça com uma estrela!

