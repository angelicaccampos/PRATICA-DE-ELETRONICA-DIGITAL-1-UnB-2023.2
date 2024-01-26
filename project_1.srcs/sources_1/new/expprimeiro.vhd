library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity expprimeiro is
    Port ( porta : in STD_LOGIC ;   -- Entrada para o estado da porta do motorista (aberto: 1 / fechado: 0)
           ignicao : in STD_LOGIC ;   -- Entrada para o estado da ignição (ligada: 1 / desligada: 0)
           farol : in STD_LOGIC;    -- Entrada para o estado dos faróis (aceso: 1 / apagado: 0)
           alarme : out STD_LOGIC);  -- Saída para o sinal de ativação do alarme
end expprimeiro;

architecture Behavioral of expprimeiro is

begin
        -- Verifica as condições para ativar o alarme:
        -- (i) Quando os faróis estão acesos e a ignição está desligada
        -- (ii) Quando a porta do veículo está aberta e a ignição está ligada
        
        alarme <= (farol and (not ignicao)) or (porta and ignicao);
end Behavioral;