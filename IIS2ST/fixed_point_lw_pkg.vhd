----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/09/2017 11:00:14 AM
-- Design Name: 
-- Module Name: fixed_point_lw_pkg
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package fixed_point_lw_pkg is

    type sfixed is array (integer range <>) of std_logic; 
--        value : signed(fixed_point_nr_int_bit-1 downto -fixed_point_factor_bit);
--        --point : positive range 1 to 31;
--        --overFlow : std_logic;
--    end record;
    constant overflow_procted : boolean := true;
--    type ufixed is record 
--        value : unsigned(fixed_point_nr_of_bit-1 downto 0);
--        --point : positive range 1 to 31;
--    end record;


    
    function to_sfixed(x : in real; int, fac : in natural) return sfixed;
    
    --function to_sfixed(x : in integer) return sfixed;
    function to_sfixed(x : in signed; int, fac : in natural) return sfixed;
    
    function to_sfixed(x : in signed; n_shift_rigth, int, fac : in natural) return sfixed;
    
    
    function to_sfixed(x : in real; ref : in sfixed) return sfixed;
        
    function to_sfixed(x : in signed; ref : in sfixed) return sfixed;
        
    function to_sfixed(x : in signed; n_shift_rigth: in natural; ref : in sfixed) return sfixed;
    
    
    --function to_integer(x : in sfixed; factor : in positive) return integer;
    
    function to_signed(x : in sfixed) return signed;
    
    function to_signed(x : in sfixed; n_shift_left : in natural) return signed;
    
    function to_real(x : in sfixed) return real;
    
    function resize(x, ref : in sfixed) return sfixed;
    
    function resize(x : in sfixed; int, fac : in natural) return sfixed;
    
    function overflow(x : in sfixed) return boolean;
    
--    function to_ufixed(x : in positive; div : in positive) return ufixed;
    

    
    function "+"(a, b : in sfixed) return sfixed;
    
    function "-"(a, b : in sfixed) return sfixed;
    
    function "*"(a, b : in sfixed) return sfixed;
    
    function MUL_ref(a, b, ref : in sfixed) return sfixed;
    
    function safe_resize(x : in signed; size : in positive) return signed;
    
end fixed_point_lw_pkg;

package body fixed_point_lw_pkg is
    
    function safe_resize(x : in signed; size : in positive) return signed is
    variable tmp : signed(size-1 downto 0);
    variable overflow : std_logic := '0';
    begin
        
        tmp := resize(x, size);

        if overflow_procted and tmp'high < x'high then
--            for i in (x'high-1) downto tmp'high-1 loop
--                overflow := overflow or (x(x'high) xor x(i));
--            end loop;
            if x(x'high downto tmp'high-1) /= 0 or (-x(x'high downto tmp'high-1)) /= 0 then
                overflow := '1';
            end if;
        end if;
        if overflow = '1' then
            tmp := (tmp'high => x(x'high) ,others => not x(x'high));
        end if;
        
        return tmp;
    end safe_resize;
    
    function to_sfixed(x : in real; int, fac : in natural) return sfixed is
    variable tmp : sfixed(int-1 downto -fac);
    begin        
        tmp := to_sfixed(to_signed(integer(x * real(2**(-tmp'low))),int+fac), int, fac);        
        return tmp;
    end to_sfixed;
    
    function to_sfixed(x : in signed; int, fac : in natural) return sfixed is
        variable tmp : sfixed(int-1 downto -fac);
		variable x_tmp : signed(tmp'length-1 downto 0);
    begin
        
		x_tmp := safe_resize(x, tmp'length);
		
        assert x_tmp'length = tmp'length report "error - fixed_point_lw_pkg - mismacht signed length and sfixed length" severity failure;

            for i in tmp'range loop
                tmp(i) := x_tmp(i+fac);
            end loop;
            return tmp;

    end to_sfixed;
    
    function to_sfixed(x : in signed; n_shift_rigth, int, fac : in natural) return sfixed is
        variable tmp : sfixed(int-1 downto -fac);
        variable tmp_sig : signed(int+fac-1 downto 0);
    begin
        
        if (fac-n_shift_rigth) >= 0 then
            tmp_sig := safe_resize(SHIFT_LEFT(x, fac-n_shift_rigth) ,tmp_sig'length);
        else
            tmp_sig := safe_resize(SHIFT_RIGHT(x, -(fac-n_shift_rigth)) ,tmp_sig'length);
        end if;

        tmp := to_sfixed(tmp_sig, int, fac);
        return tmp;
    end to_sfixed;
    
    
    function to_sfixed(x : in real; ref : in sfixed) return sfixed is
    begin
        return to_sfixed(x, ref'high+1, -ref'low);
    end to_sfixed;
        
    function to_sfixed(x : in signed; ref : in sfixed) return sfixed is
    begin
        return to_sfixed(x, ref'high+1, -ref'low);
    end to_sfixed;
        
    function to_sfixed(x : in signed; n_shift_rigth: in natural; ref : in sfixed) return sfixed is
    begin
        return to_sfixed(x, n_shift_rigth, ref'high+1, -ref'low);
    end to_sfixed;
    
    
--    function to_sfixed(x : in signed; div  : in positive; int, fac : in natural) return sfixed is
--    variable tmp : sfixed;
--    begin        
--        tmp.value :=  resize((to_signed(x,fixed_point_nr_of_bit+fixed_point_factor_bit) sll fixed_point_factor_bit) / div,fixed_point_nr_of_bit);
--        --tmp.overFlow := '0';
--        return tmp;
--    end to_sfixed;


--    function to_ufixed(x : in positive; div : in positive) return ufixed is
--    variable tmp : ufixed;
--    begin        
--        tmp.value :=  ((to_unsigned(x,fixed_point_nr_of_bit) sll fixed_point_factor_bit) / div);
        
--        return tmp;
--    end to_ufixed;
    
--    function to_integer(x : in sfixed; factor : in positive) return integer is
--    variable tmp : signed(fixed_point_nr_of_bit+fixed_point_factor_bit downto 0);
--    begin
--        tmp := (x.value * to_signed(factor,fixed_point_factor_bit + 1));
    
--        return to_integer(resize(tmp srl fixed_point_factor_bit, fixed_point_nr_of_bit));
--    end to_integer;
    
    function to_signed(x : in sfixed) return signed is
        variable tmp : signed(x'length-1 downto 0);
    begin
        
        assert tmp'length = x'length report "error - fixed_point_lw_pkg - mismacht signed length and sfixed length" severity failure;
        
        for i in x'range loop
            tmp(i-x'low) := x(i);
        end loop;
        return tmp;

    end to_signed;
    
    function to_signed(x : in sfixed; n_shift_left : in natural) return signed is
        --variable tmp : signed(x'high+n_shift_left downto 0);
        variable tmp_fix : sfixed(x'high downto -n_shift_left);
    begin
        
        --assert tmp'length <= x'length report "error - fixed_point_lw_pkg - signed length is longer then sfixed length" severity failure;
        --tmp := to_signed(x) s;
        
        for i in tmp_fix'range loop
            if i = tmp_fix'high then
                tmp_fix(i) := x(x'high);
            elsif x'low <= i and i <= x'high then
                tmp_fix(i) := x(i);
            else
                tmp_fix(i) := x(x'high);
            end if;

        end loop;
        return to_signed(tmp_fix);
    
    end to_signed;
      
    
    function to_real(x : in sfixed) return real is
    begin
        return real(to_integer(to_signed(x))) / real(2**(-x'low)); 
    end to_real;
    
    
    function resize(x, ref : in sfixed) return sfixed is
        variable tmp_sig : signed(ref'length-1 downto 0);
    begin
        tmp_sig := safe_resize(to_signed(x, -ref'low),ref'length);
        
 
        return to_sfixed(tmp_sig, ref'high+1, -ref'low);
    end resize;
        
    function resize(x : in sfixed; int, fac : in natural) return sfixed is
        variable tmp_sig : signed(int+fac-1 downto 0);
        variable overflow : std_logic := '0';
    begin
        
        
            tmp_sig := safe_resize(to_signed(x, fac),int+fac);
            return to_sfixed(tmp_sig, int, fac);
        
    end resize;
    
    
    
    function "+"(a, b : in sfixed) return sfixed is
    variable tmp :sfixed(a'high downto a'low);
    variable tmp_sig : signed(a'length-1+1 downto 0);
    begin
    
        assert a'high = b'high and a'low = b'low report "error - fixed_point_lw_pkg - mismacht sfixeds" severity failure;
        
        tmp_sig := resize(to_signed(a),tmp_sig'length)  + resize(to_signed(b),tmp_sig'length);
        
        
        if tmp_sig(tmp_sig'high-1) = tmp_sig(tmp_sig'high) then 
            tmp := to_sfixed(resize(tmp_sig,a'length), a'high+1, -a'low);
        else
            tmp := (tmp'high => tmp_sig(tmp_sig'high) ,others => not tmp_sig(tmp_sig'high));
        end if;
        return tmp;
    end "+";
    
    function "-"(a, b : in sfixed) return sfixed is
    variable tmp :sfixed(a'high downto a'low);
    begin
    
        assert a'high = b'high and a'low = b'low report "error - fixed_point_lw_pkg - mismacht sfixeds" severity failure;

        tmp := to_sfixed(safe_resize(resize(to_signed(a), a'length+1) - resize(to_signed(b), a'length+1),a'length) , a'high+1, -a'low);
        return tmp;
    end "-";
    
    function overflow(x : in sfixed) return boolean is
    variable overflow_tmp : std_logic := '1'; 
    begin
        for i in x'high-1 downto x'low loop
            overflow_tmp := overflow_tmp and (x(x'high) xor x(i));
        end loop;
        
        return overflow_tmp = '1';
    end overflow;
    
    function "*"(a, b : in sfixed) return sfixed is
    variable calc_tmp : signed(a'length+b'length-1 downto 0);
    variable tmp :sfixed(a'high downto a'low);
    variable OverFlow : std_logic := '0';
    begin
        
        assert a'high = b'high and a'low = b'low report "error - fixed_point_lw_pkg - mismacht sfixeds" severity failure;
        
        calc_tmp := to_signed(a) * to_signed(b);
        
        --OverFlow := calc_tmp(calc_tmp'high) xor calc_tmp(a'length-1);
        
        calc_tmp := SHIFT_RIGHT(calc_tmp,-a'low);


        tmp := to_sfixed(safe_resize(calc_tmp,a'length), a);

        return tmp;
    end "*";
    
--    function MUL_ref(a, b, ref : in sfixed) return sfixed is
--    variable calc_tmp : signed(a'length+b'length-1 downto 0);
--    variable tmp :sfixed(ref'high downto ref'low);
--    variable OverFlow : std_logic := '0'; 
--    constant Shift_value : integer := (-a'low)+(-b'low)-(-ref'low);
--    begin
--        calc_tmp := to_signed(a) * to_signed(b);
--        if Shift_value >= 0 then
--            calc_tmp := SHIFT_RIGHT(calc_tmp, Shift_value);
--        else
--            calc_tmp := SHIFT_LEFT(calc_tmp, -Shift_value);
--        end if;
--        if(ref'length < calc_tmp'high-(Shift_value)) then
--            for i in calc_tmp'high-(Shift_value) downto ref'length loop
--                OverFlow := OverFlow or (calc_tmp(i) xor calc_tmp(calc_tmp'high));
--            end loop;
--        end if;
--        if OverFlow = '0' then
--            tmp := to_sfixed(resize(calc_tmp,ref'length), ref);
--        else
--            tmp := (tmp'high => calc_tmp(calc_tmp'high) ,others => not calc_tmp(calc_tmp'high)); -- returns the biggest negativ number or biggest positiv number then overflow happens.
--        end if;

--        return tmp;
--    end MUL_ref;


    function MUL_ref(a, b, ref : in sfixed) return sfixed is
    
    variable tmp :sfixed(ref'high downto ref'low);
    variable OverFlow : std_logic := '0'; 
    constant Shift_value : integer := (-a'low)+(-b'low)-(-ref'low);
    variable calc_tmp : signed(a'length+b'length-1 downto 0);
    begin
        calc_tmp := to_signed(a) * to_signed(b);
        if Shift_value >= 0 then
            calc_tmp := SHIFT_RIGHT(calc_tmp, Shift_value);
        else
            calc_tmp := SHIFT_LEFT(calc_tmp, -Shift_value);
        end if;

        return to_sfixed(safe_resize(calc_tmp, ref'length), ref);
    end MUL_ref;
    
    
end fixed_point_lw_pkg;
