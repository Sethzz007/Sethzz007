🛡️ Sistema Anti-Cheat para Roblox

Um sistema modular de anti-exploit para jogos Roblox, projetado para detectar e prevenir comportamentos suspeitos de jogadores. 

🚀 Recursos

Detecção de Speed Hack

Detecção de Jump Hack

Detecção de Fly Hack

Bloqueio de abuso de RemoteEvents

Fácil adaptação às regras específicas do seu jogo 


🧩 Estrutura do Projeto

AntiCheatModule (ModuleScript)

AntiCheatServer (Script)

RemoteEvent protegido no ReplicatedStorage 


🛠️ Como Usar

1. Crie os seguintes arquivos no ServerScriptService:

Um ModuleScript chamado AntiCheatModule

Um Script chamado AntiCheatServer



2. Crie um RemoteEvent no ReplicatedStorage com o nome GiveCoins.


3. Adapte a função GetMaxSpeed no módulo para refletir os limites de velocidade do seu jogo. 



🧪 Exemplo de Detecção

if humanoid.WalkSpeed > maxSpeed + 2 then
    player:Kick("Speed hack detectado.")
end



📄 Licença

MIT. Sinta-se à vontade para usar, modificar e distribuir conforme necessário. 
