library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity push_synchronizer is

	generic(
		NbrBits	: positive := 28
	);
	port(
		tx_clk,
		tx_reset_n,
		rx_clk,
		rx_reset_n,
		tx_sync,
		rx_sync : in std_logic;
		tx_data : in std_logic_vector(NbrBits-1 downto 0);
		rx_data : out std_logic_vector(NbrBits-1 downto 0)
	);
end entity push_synchronizer;

architecture rtl of push_synchronizer is
-- types -------------------------------------
type TX_state is (init, transmit, ready);
type RX_state is (init, wait_fr, wait_faa, receiving); -- wait_fr: wait for requst. wait_faa: wait for ack on ack

type double_ff_array is array(1 downto 0) of std_logic;

-- signals -----------------------------------

-- FSM_TX

signal TX_curr_state : TX_state;
signal tx_sync_pre : std_logic;
signal tx_requst : std_logic;
signal rx_accept_d_ff : double_ff_array;
signal data : std_logic_vector(NbrBits-1 downto 0);

-- FSM_RX

signal RX_curr_state : RX_state;
signal rx_accept : std_logic;
signal tx_requst_d_ff : double_ff_array;
signal data_latch, data_latch_out, data_latch_pre : std_logic_vector(NbrBits-1 downto 0);
signal data_ready, data_ready_pre, data_ready_post, rx_sync_pre : std_logic;
-- constants ----------------------------------


begin
	
	
	-- init -(wait for trig)-> transmit : send requst, set ready flag low -(wait for accept)-> ready : set ready flag high -(wait for trig)-> goto transmit
	--							(X)<-----------------------------------------------------------------------------------------------------------------|
	--               |-------------------------------------------------------------------------->(X)
	-- others goto ready
	-- trig => tx_sync going to high
	FSM_TX : process(tx_clk, tx_reset_n)
	begin
		if tx_reset_n = '0' then
			TX_curr_state <= init;
			tx_sync_pre <= '1';
			data <= (others => '0');
			tx_requst <= '0';
			rx_accept_d_ff <= (others => '0');
		elsif rising_edge(tx_clk) then
			-- default values
			TX_curr_state <= TX_curr_state;
			data <= data;
			tx_requst <= '0';
			-- FSM_TX ---------
			case TX_curr_state is
				when init =>
					TX_curr_state <= ready;
				when transmit =>
					tx_requst <= '1';
					if rx_accept_d_ff(0) = '1' then
						TX_curr_state <= ready;
					end if;
				when ready =>
					if tx_sync = '1' and tx_sync_pre = '0' then
						data <= tx_data;
						tx_requst <= '1';
						TX_curr_state <= transmit;
					end if;
				when others =>
					TX_curr_state <= ready;
			end case;
			-- FSM_TX end -------
			
			
			tx_sync_pre <= tx_sync;
			rx_accept_d_ff(1) <= rx_accept;
			rx_accept_d_ff(0) <= rx_accept_d_ff(1);
		end if;
	end process;

	-- init --> wait_fr -(wait for requst)-> receiving : send accept, load data to latch --> wait_faa -(wait for requst to go low)-> goto wait
	--           (X)<----------------------------------------------------------------------------------------------------------------------|
	--           (X)<-|
	-- others goto wait
	FSM_RX : process(rx_clk, rx_reset_n)
	begin
		if rx_reset_n = '0' then
			RX_curr_state <= init;
			data_latch <= (others => '0');
			rx_accept <= '0';
			data_ready <= '0';
		elsif rising_edge(rx_clk) then
			-- default values
			RX_curr_state <= RX_curr_state;
			data_latch <= data_latch;
			rx_accept <= rx_accept;
			data_ready <= data_ready;
			-- FSM_RX ------------
			case RX_curr_state is
				when init =>
					RX_curr_state <= wait_fr;
				when wait_fr =>
					
					if tx_requst_d_ff(0) = '1' then
						data_latch <= data;
						rx_accept <= '1';
						RX_curr_state <= wait_faa;
						data_ready_post <= '1';
					end if;
				when wait_faa =>
					
					rx_accept <= '1';
					if tx_requst_d_ff(0) = '0' then
						rx_accept <= '0';
						RX_curr_state <= wait_fr;
						data_ready_post <= '0';
					end if;
				--when wait_sync =>
					
					
				when others =>
					RX_curr_state <= wait_fr;
			end case;

			-- FSM_RX end --------
			if rx_sync = '1' and rx_sync_pre = '0' then
				data_latch_out <= data_latch;
			end if;

			rx_sync_pre <= rx_sync;
			data_ready <= data_ready_post;
			tx_requst_d_ff(1) <= tx_requst;
			tx_requst_d_ff(0) <= tx_requst_d_ff(1);
			
		end if;
	end process;
	
	RX_latch_data : process(rx_sync, rx_reset_n)
	begin
		if rx_reset_n = '0' then
			rx_data <= (others => '0');
			--data_latch_pre <= (others => '0');
			--data_ready_pre <= '1';
		elsif rising_edge(rx_sync) then
			rx_data <= data_latch_out;
			--if data_ready = '1' and data_ready_pre = '0' then
				
			--	data_latch_pre <= data_latch;
			--else
			--	rx_data <= data_latch_pre;
			--end if;--
--
			
	--		data_ready_pre <= data_ready;
		end if;
	end process;
	
end architecture rtl;