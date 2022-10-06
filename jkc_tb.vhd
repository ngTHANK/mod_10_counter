
 LIBRARY ieee;  
 USE ieee.std_logic_1164.ALL;  
 USE ieee.std_logic_unsigned.all;  
 USE ieee.numeric_std.ALL;  

 ENTITY jkc_tb IS  
 END jkc_tb;  

 ARCHITECTURE behavior OF jkc_tb IS  
   COMPONENT jkc  
   PORT(  
     clock : IN std_logic;  
     reset : IN std_logic;  
     count : out std_logic_vector(3 downto 0)     
     );  
   END COMPONENT;
  
   --Inputs  
   SIGNAL clock : std_logic := '0';  
   SIGNAL reset : std_logic := '1';  
   SIGNAL count : std_logic_vector(3 downto 0);
   CONSTANT clock_period : time := 20 ns; 
 BEGIN  
   uut: jkc PORT MAP(  
     clock => clock,  
     reset => reset,  
     count => count  
   );  

   PROCESS  
   BEGIN  
       wait for clock_period/2;  
       clock <= not clock;  
   END PROCESS; 
 
   PROCESS  
   BEGIN 
    	WAIT UNTIL clock='1' AND clock'event;
	WAIT FOR clock_period/2;
    	reset <= '0';
    	reset <= count(0) AND count(3);  
   END PROCESS;  
 END;
