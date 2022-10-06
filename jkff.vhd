 library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  
 use IEEE.STD_LOGIC_ARITH.ALL;  
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
  
 entity jkff is  
 Port ( j     : in STD_LOGIC;  
        k     : in STD_LOGIC;  
        clock : in STD_LOGIC;  
        reset : in STD_LOGIC;  
        q     : out STD_LOGIC  
    );  
 end jkff;  

 architecture rtl of jkff is  
 signal jk    : std_logic_vector(1 downto 0) := "00";  
 signal qsig  : std_logic := '0';
  
 begin  
 process(reset,clock)  
 begin  
     if (reset = '1')then  
         qsig <='0';  
     elsif (clock'event and clock = '0')then  
         qsig <= (j AND (NOT qsig)) OR ((NOT k) AND qsig);
     end if;  
 end process;
  
 q <= qsig;  
 end rtl;

