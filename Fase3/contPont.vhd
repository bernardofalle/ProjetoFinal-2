--library IEEE;
--use IEEE.STD_LOGIC_1164.all;
--use IEEE.NUMERIC_STD.all;
--
--entity contPont is
--	generic(N : positive := 99);    -- Sets the upper limit '99'
--
--	port(enable		: in std_logic;
--		  clk      : in  std_logic;
--		  add		: in  std_logic; 
--		  sub	: in std_logic;
--		  go0 : in std_logic;
--		  reset    : in  std_logic;
--		  count    : out std_logic_vector(7 downto 0)); -- Counts in  binary
--end contPont;
--
--architecture Behavioral of contPont is
--	signal s_count : unsigned(7 downto 0) := to_unsigned(0,8); 
--begin
--	process(clk)
--
--	begin
--		if(rising_edge(clk)) then
--			if(reset = '1') then
--				s_count <= to_unsigned(0,8);
--			elsif (enable = '1') then
--					if(add = '1') then 
--						s_count <= s_count + 1;							
--					elsif (sub = '1') then	
--						s_count <= s_count - 1;
--					elsif ( go0 = '1' or s_count = N) then
--						s_count <= to_unsigned(0,8);
--					end if;
--			end if;
--		end if;
--	end process;
--
--	count <= std_logic_vector(s_count);
--end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity contPont is
	generic(N : positive := 99);    -- Sets the upper limit '99'

	port(enable		: in std_logic;
		  clk      	: in  std_logic;
		  add			: in  std_logic; 
		  sub			: in std_logic;
		  --go0 		: in std_logic;
		  reset    	: in  std_logic;
		  count    	: out std_logic_vector(7 downto 0)); -- Counts in  binary
end contPont;

architecture Behavioral of contPont is
	signal s_count : unsigned(7 downto 0) := to_unsigned(0,8); 
begin
	process(clk)

	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				s_count <= to_unsigned(0,8);
			else
				if (enable = '1') then
					if(add = '1') then 
						s_count <= s_count + 1;							
					elsif (sub = '1') then	
						s_count <= s_count - 1;
					--elsif ( go0 = '1' ) then
					--	s_count <= to_unsigned(0,8);
					--else
					--	s_count <= s_count;
					end if;
				end if;
			end if;
		end if;
	end process;

	count <= std_logic_vector(s_count);
end Behavioral;