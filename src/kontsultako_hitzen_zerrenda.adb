with Ada.Text_Io;
use Ada.Text_Io;
with Lista_Ordenatuak;
with Hitzak;

package body Kontsultako_Hitzen_Zerrenda is

   package Zerrenda is new Lista_Ordenatuak (

      Osagai   => Hitzak.Hitz,
      Asignatu => Hitzak.Kopiatu,
      Berdin   => Hitzak.Berdin);

   Hz : Zerrenda.Lista_Ordenatua;

   procedure Eraiki is
      Hitza     : String (1 .. 80);
      L         : Natural;
      H         : Hitzak.Hitz;
      Erantzuna : Character        := 'B';
   begin
      Zerrenda.Sortu_Hutsa (Hz);
      while Erantzuna ='B' or Erantzuna='b' loop
         Put_Line("Sartu kontsultatzeko hitza:");
         Get_Line(Hitza,L);
         Hitzak.Sortu (Hitza(1..L),H);
         Zerrenda.Erantsi_Bukaeran(Hz,H);
         Put_Line("Idatzi B edo b beste hitz bat sartzeko");
         Put_line("Bestela idatzi beste letra bat");
         Get(Erantzuna);
         Skip_Line;
      end loop;
      exception
         when Zerrenda.Lekurik_Ez => raise Lekurik_Ez;
         when Storage_Error => raise Lekurik_Ez;
   end Eraiki;

   procedure Hurrengo_Hitza_Lortu (
         H :    out Hitzak.Hitz ) is
   begin
      Hitzak.Kopiatu (Zerrenda.Lehena(Hz),H);
      exception
         when Zerrenda.Lekurik_Ez => raise Lekurik_Ez;
         when Storage_Error => raise Lekurik_Ez;  
   end Hurrengo_Hitza_Lortu;

   procedure Hitza_Kendu is
   begin
      Zerrenda.Lehena_Kendu(Hz);
   exception
      when Zerrenda.Hutsik_Dago => raise Hutsik_Dago;
   end Hitza_Kendu;

   function Hutsa_Da return Boolean is
   begin
      return Zerrenda.Hutsa_Da(Hz);
   end Hutsa_Da;

end Kontsultako_Hitzen_Zerrenda;