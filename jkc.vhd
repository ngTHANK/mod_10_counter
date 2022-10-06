
 library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  
 use IEEE.STD_LOGIC_ARITH.ALL;  
 use IEEE.STD_LOGIC_UNSIGNED.ALL;  

 entity jkc is  
 Port ( clock : in std_logic;  
        reset : in std_logic;  
        count : out std_logic_vector(3 downto 0)  
    );  
 end jkc;
  
 architecture rtl of jkc is  
 COMPONENT jkff  
   PORT(  
     clock : in std_logic;  
     reset : in std_logic;  
     j     : in std_logic;  
     k     : in std_logic;  
     q     : out std_logic      
     );  
   END COMPONENT;
  
 signal temp : std_logic_vector(3 downto 0) := "0000";  
 begin  
 d0 : jkff  
     port map (  
       reset  => reset,  
       clock  => clock,  
       j      => '1',  
       k      => '1',        
       q      => temp(3)  
     );  

 d1 : jkff  
     port map (  
       reset  => reset,  
       clock  => temp(3),  
       j      => '1',  
       k      => '1',      
       q      => temp(2)  
     );  

 d2 : jkff  
     port map (  
       reset  => reset,  
       clock  => temp(2),  
       j      => '1',  
       k      => '1',  
       q      => temp(1)  
     );  

 d3 : jkff  
     port map (  
       reset  => reset,  
       clock  => temp(1),  
       j      => '1',  
       k      => '1',  
       q      => temp(0)  
     );  

 count(0) <= temp(3);  
 count(1) <= temp(2);  
 count(2) <= temp(1);  
 count(3) <= temp(0);      
 end rtl;  
