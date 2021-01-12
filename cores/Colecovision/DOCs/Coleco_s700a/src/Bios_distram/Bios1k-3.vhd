-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

library UNISIM;
  use UNISIM.Vcomponents.all;

entity cart_rom3 is
  port (
    CLK         : in    std_logic;
    ADDR        : in    std_logic_vector(11 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of cart_rom3 is


  type ROM_ARRAY is array(5120 to 6143) of std_logic_vector(7 downto 0);
  constant ROM : ROM_ARRAY := (
    x"79",x"14",x"11",x"AA",x"01",x"FD",x"21",x"0D", -- 0x0000
    x"00",x"3E",x"02",x"CD",x"BE",x"1F",x"21",x"86", -- 0x0008
    x"14",x"11",x"E4",x"01",x"FD",x"21",x"1A",x"00", -- 0x0010
    x"3E",x"02",x"CD",x"BE",x"1F",x"21",x"A0",x"14", -- 0x0018
    x"11",x"27",x"02",x"FD",x"21",x"14",x"00",x"3E", -- 0x0020
    x"02",x"CD",x"BE",x"1F",x"21",x"00",x"8A",x"CD", -- 0x0028
    x"6B",x"19",x"06",x"01",x"0E",x"80",x"CD",x"D9", -- 0x0030
    x"1F",x"18",x"FE",x"00",x"00",x"00",x"F0",x"F0", -- 0x0038
    x"F0",x"F0",x"F0",x"F0",x"F0",x"F0",x"F0",x"D0", -- 0x0040
    x"80",x"90",x"B0",x"30",x"40",x"60",x"61",x"68", -- 0x0048
    x"69",x"70",x"71",x"78",x"79",x"80",x"81",x"88", -- 0x0050
    x"89",x"64",x"65",x"6C",x"74",x"75",x"7C",x"84", -- 0x0058
    x"85",x"8C",x"8D",x"62",x"63",x"6A",x"6B",x"72", -- 0x0060
    x"73",x"7A",x"7B",x"82",x"83",x"8A",x"8B",x"66", -- 0x0068
    x"67",x"6D",x"76",x"77",x"7D",x"86",x"87",x"8E", -- 0x0070
    x"8F",x"54",x"55",x"52",x"4E",x"20",x"47",x"41", -- 0x0078
    x"4D",x"45",x"20",x"4F",x"46",x"46",x"42",x"45", -- 0x0080
    x"46",x"4F",x"52",x"45",x"20",x"49",x"4E",x"53", -- 0x0088
    x"45",x"52",x"54",x"49",x"4E",x"47",x"20",x"43", -- 0x0090
    x"41",x"52",x"54",x"52",x"49",x"44",x"47",x"45", -- 0x0098
    x"4F",x"52",x"20",x"45",x"58",x"50",x"41",x"4E", -- 0x00A0
    x"53",x"49",x"4F",x"4E",x"20",x"4D",x"4F",x"44", -- 0x00A8
    x"55",x"4C",x"45",x"2E",x"1D",x"20",x"31",x"39", -- 0x00B0
    x"38",x"32",x"20",x"43",x"4F",x"4C",x"45",x"43", -- 0x00B8
    x"4F",x"1E",x"1F",x"00",x"00",x"00",x"00",x"00", -- 0x00C0
    x"00",x"00",x"00",x"3F",x"7F",x"FF",x"FF",x"F3", -- 0x00C8
    x"F3",x"F0",x"F0",x"00",x"80",x"C0",x"C0",x"C0", -- 0x00D0
    x"C0",x"00",x"00",x"3F",x"7F",x"FF",x"FF",x"F3", -- 0x00D8
    x"F3",x"F3",x"F3",x"00",x"80",x"C0",x"C0",x"C0", -- 0x00E0
    x"C0",x"C0",x"C0",x"F0",x"F0",x"F0",x"F0",x"F0", -- 0x00E8
    x"F0",x"F0",x"F0",x"FF",x"FF",x"FF",x"F0",x"F0", -- 0x00F0
    x"FF",x"FF",x"FF",x"C0",x"C0",x"C0",x"00",x"00", -- 0x00F8
    x"00",x"00",x"00",x"F1",x"F1",x"F1",x"7B",x"7B", -- 0x0100
    x"7B",x"3F",x"3F",x"E0",x"E0",x"E0",x"C0",x"C0", -- 0x0108
    x"C0",x"80",x"80",x"1F",x"3F",x"7F",x"79",x"78", -- 0x0110
    x"7F",x"7F",x"3F",x"80",x"C0",x"E0",x"E0",x"00", -- 0x0118
    x"80",x"C0",x"E0",x"F3",x"F3",x"FB",x"FB",x"FB", -- 0x0120
    x"FF",x"FF",x"FF",x"C0",x"C0",x"C0",x"C0",x"C0", -- 0x0128
    x"C0",x"C0",x"C0",x"F3",x"F3",x"FF",x"FF",x"7F", -- 0x0130
    x"3F",x"00",x"00",x"C0",x"C0",x"C0",x"C0",x"80", -- 0x0138
    x"00",x"00",x"00",x"F0",x"F0",x"FF",x"FF",x"FF", -- 0x0140
    x"FF",x"00",x"00",x"00",x"00",x"C0",x"C0",x"C0", -- 0x0148
    x"C0",x"00",x"00",x"3F",x"1F",x"1F",x"1F",x"0E", -- 0x0150
    x"0E",x"00",x"00",x"80",x"00",x"00",x"00",x"00", -- 0x0158
    x"00",x"00",x"00",x"F0",x"F0",x"F0",x"F0",x"F0", -- 0x0160
    x"F0",x"00",x"00",x"1F",x"01",x"79",x"7F",x"3F", -- 0x0168
    x"1F",x"00",x"00",x"E0",x"E0",x"E0",x"E0",x"C0", -- 0x0170
    x"80",x"00",x"00",x"FF",x"F7",x"F7",x"F7",x"F3", -- 0x0178
    x"F3",x"00",x"00",x"C0",x"C0",x"C0",x"C0",x"C0", -- 0x0180
    x"C0",x"00",x"00",x"7E",x"81",x"BD",x"A1",x"A1", -- 0x0188
    x"BD",x"81",x"7E",x"1F",x"04",x"04",x"04",x"00", -- 0x0190
    x"00",x"00",x"00",x"44",x"6C",x"54",x"54",x"00", -- 0x0198
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x01A0
    x"00",x"00",x"00",x"20",x"20",x"20",x"20",x"20", -- 0x01A8
    x"00",x"20",x"00",x"50",x"50",x"50",x"00",x"00", -- 0x01B0
    x"00",x"00",x"00",x"50",x"50",x"F8",x"50",x"F8", -- 0x01B8
    x"50",x"50",x"00",x"20",x"78",x"A0",x"70",x"28", -- 0x01C0
    x"F0",x"20",x"00",x"C0",x"C8",x"10",x"20",x"40", -- 0x01C8
    x"98",x"18",x"00",x"40",x"A0",x"A0",x"40",x"A8", -- 0x01D0
    x"90",x"68",x"00",x"20",x"20",x"20",x"00",x"00", -- 0x01D8
    x"00",x"00",x"00",x"20",x"40",x"80",x"80",x"80", -- 0x01E0
    x"40",x"20",x"00",x"20",x"10",x"08",x"08",x"08", -- 0x01E8
    x"10",x"20",x"00",x"20",x"A8",x"70",x"20",x"70", -- 0x01F0
    x"A8",x"20",x"00",x"00",x"20",x"20",x"F8",x"20", -- 0x01F8
    x"20",x"00",x"00",x"00",x"00",x"00",x"00",x"20", -- 0x0200
    x"20",x"40",x"00",x"00",x"00",x"00",x"F8",x"00", -- 0x0208
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0210
    x"00",x"20",x"00",x"00",x"08",x"10",x"20",x"40", -- 0x0218
    x"80",x"00",x"00",x"70",x"88",x"98",x"A8",x"C8", -- 0x0220
    x"88",x"70",x"00",x"20",x"60",x"20",x"20",x"20", -- 0x0228
    x"20",x"70",x"00",x"70",x"88",x"08",x"30",x"40", -- 0x0230
    x"80",x"F8",x"00",x"F8",x"08",x"10",x"30",x"08", -- 0x0238
    x"88",x"70",x"00",x"10",x"30",x"50",x"90",x"F8", -- 0x0240
    x"10",x"10",x"00",x"F8",x"80",x"F0",x"08",x"08", -- 0x0248
    x"88",x"70",x"00",x"38",x"40",x"80",x"F0",x"88", -- 0x0250
    x"88",x"70",x"00",x"F8",x"08",x"10",x"20",x"40", -- 0x0258
    x"40",x"40",x"00",x"70",x"88",x"88",x"70",x"88", -- 0x0260
    x"88",x"70",x"00",x"70",x"88",x"88",x"78",x"08", -- 0x0268
    x"10",x"E0",x"00",x"00",x"00",x"20",x"00",x"20", -- 0x0270
    x"00",x"00",x"00",x"00",x"00",x"20",x"00",x"20", -- 0x0278
    x"20",x"40",x"00",x"10",x"20",x"40",x"80",x"40", -- 0x0280
    x"20",x"10",x"00",x"00",x"00",x"F8",x"00",x"F8", -- 0x0288
    x"00",x"00",x"00",x"40",x"20",x"10",x"08",x"10", -- 0x0290
    x"20",x"40",x"00",x"70",x"88",x"10",x"20",x"20", -- 0x0298
    x"00",x"20",x"00",x"70",x"88",x"A8",x"B8",x"B0", -- 0x02A0
    x"80",x"78",x"00",x"20",x"50",x"88",x"88",x"F8", -- 0x02A8
    x"88",x"88",x"00",x"F0",x"88",x"88",x"F0",x"88", -- 0x02B0
    x"88",x"F0",x"00",x"70",x"88",x"80",x"80",x"80", -- 0x02B8
    x"88",x"70",x"00",x"F0",x"88",x"88",x"88",x"88", -- 0x02C0
    x"88",x"F0",x"00",x"F8",x"80",x"80",x"F0",x"80", -- 0x02C8
    x"80",x"F8",x"00",x"F8",x"80",x"80",x"F0",x"80", -- 0x02D0
    x"80",x"80",x"00",x"78",x"80",x"80",x"80",x"98", -- 0x02D8
    x"88",x"78",x"00",x"88",x"88",x"88",x"F8",x"88", -- 0x02E0
    x"88",x"88",x"00",x"70",x"20",x"20",x"20",x"20", -- 0x02E8
    x"20",x"70",x"00",x"08",x"08",x"08",x"08",x"08", -- 0x02F0
    x"88",x"70",x"00",x"88",x"90",x"A0",x"C0",x"A0", -- 0x02F8
    x"90",x"88",x"00",x"80",x"80",x"80",x"80",x"80", -- 0x0300
    x"80",x"F8",x"00",x"88",x"D8",x"A8",x"A8",x"88", -- 0x0308
    x"88",x"88",x"00",x"88",x"88",x"C8",x"A8",x"98", -- 0x0310
    x"88",x"88",x"00",x"70",x"88",x"88",x"88",x"88", -- 0x0318
    x"88",x"70",x"00",x"F0",x"88",x"88",x"F0",x"80", -- 0x0320
    x"80",x"80",x"00",x"70",x"88",x"88",x"88",x"A8", -- 0x0328
    x"90",x"68",x"00",x"F0",x"88",x"88",x"F0",x"A0", -- 0x0330
    x"90",x"88",x"00",x"70",x"88",x"80",x"70",x"08", -- 0x0338
    x"88",x"70",x"00",x"F8",x"20",x"20",x"20",x"20", -- 0x0340
    x"20",x"20",x"00",x"88",x"88",x"88",x"88",x"88", -- 0x0348
    x"88",x"70",x"00",x"88",x"88",x"88",x"88",x"88", -- 0x0350
    x"50",x"20",x"00",x"88",x"88",x"88",x"A8",x"A8", -- 0x0358
    x"D8",x"88",x"00",x"88",x"88",x"50",x"20",x"50", -- 0x0360
    x"88",x"88",x"00",x"88",x"88",x"50",x"20",x"20", -- 0x0368
    x"20",x"20",x"00",x"F8",x"08",x"10",x"20",x"40", -- 0x0370
    x"80",x"F8",x"00",x"F8",x"C0",x"C0",x"C0",x"C0", -- 0x0378
    x"C0",x"F8",x"00",x"00",x"80",x"40",x"20",x"10", -- 0x0380
    x"08",x"00",x"00",x"F8",x"18",x"18",x"18",x"18", -- 0x0388
    x"18",x"F8",x"00",x"00",x"00",x"20",x"50",x"88", -- 0x0390
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0398
    x"00",x"00",x"F8",x"40",x"20",x"10",x"00",x"00", -- 0x03A0
    x"00",x"00",x"00",x"00",x"00",x"70",x"88",x"F8", -- 0x03A8
    x"88",x"88",x"00",x"00",x"00",x"F0",x"48",x"70", -- 0x03B0
    x"48",x"F0",x"00",x"00",x"00",x"78",x"80",x"80", -- 0x03B8
    x"80",x"78",x"00",x"00",x"00",x"F0",x"48",x"48", -- 0x03C0
    x"48",x"F0",x"00",x"00",x"00",x"F0",x"80",x"E0", -- 0x03C8
    x"80",x"F0",x"00",x"00",x"00",x"F0",x"80",x"E0", -- 0x03D0
    x"80",x"80",x"00",x"00",x"00",x"78",x"80",x"B8", -- 0x03D8
    x"88",x"70",x"00",x"00",x"00",x"88",x"88",x"F8", -- 0x03E0
    x"88",x"88",x"00",x"00",x"00",x"F8",x"20",x"20", -- 0x03E8
    x"20",x"F8",x"00",x"00",x"00",x"70",x"20",x"20", -- 0x03F0
    x"A0",x"E0",x"00",x"00",x"00",x"90",x"A0",x"C0"  -- 0x03F8
  );


signal AR	: std_logic_vector(12 downto 0);

begin

AR(12 downto 10) <= "101";
  process(CLK)
  begin
    if Clk'event and Clk = '1' then
       AR(9 downto 0) <= ADDR(9 downto 0);
    end if;		 
  end process;

    process (AR)
	 begin
	   DATA <= ROM(to_integer(unsigned(AR)));
    end process; 

end RTL;