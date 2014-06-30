with Ada.Text_Io;
use Ada.Text_Io;
with Ada.Direct_Io;
with Tokenizatzailea,Indizea,Posizio_Taula,Posizio_Listak;
with Posizioak,Pos_Luzera_Bikoteak,Indizeko_Sarrerak,Testuinguruak;
package body Dokumentua is

   package Dok_Si is new Ada.Direct_Io (Element_Type => Character);

   Fitx  : File_Type;
   Fitx2 : Dok_Si.File_Type;

   procedure Hasieratu is
      Izena        : String (1 .. 80);
      Tokena       : String (1 .. 80);
      L,M          : Natural;
      Hitz_Motakoa : Boolean;
      Pos          : Posizioak.Posizio                     := 1;
      Plb          : Pos_Luzera_Bikoteak.Pos_Luzera_Bikote;
      H            : Hitzak.Hitz;
   begin
      Put_Line("Idatzi fitxategiaren izena:");
      Get_Line(Izena,M);
      Open(Fitx,In_File,Izena(1..M));
      Dok_Si.Create(Fitx2,Dok_Si.Out_File,"KWIC.TMP");
      Indizea.Sortu_Hutsa;
      Posizio_Taula.Sortu_Hutsa;
      while not End_Of_File (Fitx) loop
         while not End_Of_Line (Fitx) loop
            Tokenizatzailea.Hurrengo_Tokena_Lortu (Fitx,Tokena,L,Hitz_Motakoa);
            if Hitz_Motakoa then
               Pos_Luzera_Bikoteak.Sortu(Pos,L,Plb);
               Posizio_Taula.Erantsi_Bukaeran(Plb);
               Hitzak.Sortu(Tokena(1..L),H);
               Indizea.Txertatu(H,Pos);
            end if;
            for I in Tokena'First .. Tokena'First+L-1 loop
               Dok_Si.Write(Fitx2,Tokena(I));
            end loop;
            Pos:=Pos+L;
         end loop;
         Dok_Si.Write(Fitx2,'\'); 
         Pos:=Pos+1;
         if not End_Of_File (Fitx) then
            Skip_Line(Fitx);
         end if;
      end loop;
      Close(Fitx);
      Dok_Si.Close(Fitx2);
      Dok_Si.Open(Fitx2,Dok_Si.In_File,"KWIC.TMP");
   exception
      when End_Error =>
         raise Errorea_Ixtean;
      when Status_Error =>
         raise Errorea_Irekitzean;
      when Name_Error =>
         raise Fitxategi_Ezezaguna;
      when Storage_Error =>
         raise Fitxategi_Handiegia;
      when Hitzak.Lekurik_Ez =>
         raise Fitxategi_Handiegia;
      when Indizea.Lekurik_Ez =>
         raise Fitxategi_Handiegia;
      when Posizio_Taula.Lekurik_Ez =>
         raise Fitxategi_Handiegia;
      when Pos_Luzera_Bikoteak.Lekurik_Ez =>
         raise Fitxategi_Handiegia;
      when Tokenizatzailea.Lerro_Amaia =>
         Put_Line(
            "Fitxategiaren hasiera lerro amaiera da, fitxategiak ez du testurik");
      when Tokenizatzailea.Modu_Desegokia =>
         Put_Line("Fitxategia ez dago 'In_File' moduan irekita");
      when Tokenizatzailea.Egoera_Desegokia =>
         Put_Line("Fitxategia ez dago irekita");

   end Hasieratu;


   procedure Bukatu is
   begin
      Dok_Si.Delete (Fitx2);
   exception
      when others =>
         raise Errorea_Ezabatzean;
   end Bukatu;

   procedure Hitzaren_Testuinguruak_Inprimatu (
         H : in     Hitzak.Hitz ) is
      Aurkitua,
      Aurki    : Boolean;
      I        : Indizeko_Sarrerak.Indizeko_Sarrera;
      Pl       : Posizio_Listak.Lista_Ordenatua;
      Has      : Integer;
      Am       : Integer;
      Luze     : Positive;
      Kar      : Character;
      T_Inguru : Testuinguruak.Testuinguru;
   begin
      Indizea.Sarrera_Lortu(H,Aurkitua,I);
      if Aurkitua then
         Indizeko_Sarrerak.Esan_Posizioak(I,Pl);
         while not Posizio_Listak.Hutsa_Da(Pl) loop
            Posizio_Taula.Tiaren_Has_Am_Bilatu (Posizio_Listak.Lehena(Pl),Aurki,Has,Am,Luze);
            declare
               Text : String (Has .. Am);
            begin
               for N in Has .. Am loop
                  Text(N):=' ';
               end loop;
               for K in Dok_Si.Count(Has) .. Dok_Si.Count(Am) loop
                  Dok_Si.Read(Fitx2,Kar,K);
                  Text(Integer(K)):=Kar;
               end loop;
               Testuinguruak.Sortu(Text,Posizio_Listak.Lehena(Pl),Luze,T_Inguru);
               Testuinguruak.Inprimatu(T_Inguru);
               Posizio_Listak.Lehena_Kendu(Pl);
            end;
         end loop;
      else
         raise Hasieratze_Okerra;
      end if;
   exception
      when Testuinguruak.Lekurik_Ez =>
         Put_Line("Ez dago testuinguruak sortzeko lekurik");
   end Hitzaren_Testuinguruak_Inprimatu;

end Dokumentua;