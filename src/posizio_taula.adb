with Posizioak;
with Pos_Luzera_Bikoteak;
with Lista_Ordenatuak;
package body Posizio_Taula is

   package Lista is new Lista_Ordenatuak (
      Osagai   => Pos_Luzera_Bikoteak.Pos_Luzera_Bikote,
      Asignatu => Pos_Luzera_Bikoteak.Kopiatu,
      Berdin   => Pos_Luzera_Bikoteak.Berdin);


   P_Taula : Lista.Lista_Ordenatua;


   procedure Sortu_Hutsa is
   begin
      Lista.Sortu_Hutsa(P_Taula);
   exception
      when Lista.Lekurik_Ez =>
         raise Lekurik_Ez;
   end Sortu_Hutsa;

   procedure Erantsi_Bukaeran (
         Plb : in     Pos_Luzera_Bikoteak.Pos_Luzera_Bikote ) is
   begin
      Lista.Erantsi_Bukaeran (P_Taula,Plb);
   exception
      when Lista.Lekurik_Ez =>
         raise Lekurik_Ez;
   end Erantsi_Bukaeran;

   procedure Tiaren_Has_Am_Bilatu (
         P        : in     Posizioak.Posizio;
         Aurkitua :    out Boolean;
         Has,
         Am       :    out Posizioak.Posizio;
         Luze     :    out Positive           ) is


      procedure Bilatu is
      new Lista.Bilatu_Elementua_Ordenan (
         Gako       => Posizioak.Posizio,
         Aurretik   => Posizioak.Txikiago,
         Esan_Gakoa => Pos_Luzera_Bikoteak.Lortu_Posizioa,
         Berdin     => Posizioak.Berdin);
      --Bilatu(L:in Lista_Ordenatua; K:in Gako; O:out Osagai; Aurkitua:out Boolean) 
      Bikote,
      Aurre_Bikote,
      Ondorengo_Bikote,
      Lag              : Pos_Luzera_Bikoteak.Pos_Luzera_Bikote;
      Aurki,
      Buka1,
      Ondorengo_Dago,
      Aurre_Dago       : Boolean:=false;
      Aurre,
      Ondorengo        : Posizioak.Posizio :=P;
      Zenbat_Aurre,
      Zenbat_Ondorengo : Integer:=0;
      O_Luz,
      Azkenaren_Luzera : Integer;
   begin
      Bilatu(P_Taula,P,Bikote,Aurki);
      if Aurki then
         Aurkitua:=true;
         Pos_Luzera_bikoteak.Lortu_Luzera(Bikote,Luze);
         if Aurre = 1 then
            Buka1:=True;
            Has:=P;
         end if;
         while not Buka1  loop
            Aurre:=Aurre-1;
            Bilatu(P_Taula,Aurre,Aurre_Bikote,Aurre_Dago);
            if Aurre_Dago then
               Has:=Aurre;
               Zenbat_Aurre:=Zenbat_Aurre+1;
               if Zenbat_Aurre=3 or Aurre=1 then
                  Buka1:=True;
               end if;
            else
               Has:=Aurre;
               if Aurre=1 then
                  Has:=Has+1;
                  Buka1:=True;
               end if;
            end if;
         end loop;
         Buka1:=False;
         Pos_Luzera_Bikoteak.Kopiatu(Lista.Azkena(P_Taula),Lag);
         Pos_Luzera_Bikoteak.Lortu_Luzera(Lag,Azkenaren_Luzera); 
         if Ondorengo/=Pos_Luzera_Bikoteak.Lortu_Posizioa(Lag)+Azkenaren_Luzera-1 then
            while not Buka1 loop
               Ondorengo:=Ondorengo+1;
               Bilatu(P_Taula,Ondorengo,Ondorengo_Bikote,Ondorengo_Dago);
               if Ondorengo_Dago then
                  Am:=Ondorengo;
                  Zenbat_Ondorengo:=Zenbat_Ondorengo+1;
                  if Zenbat_Ondorengo=3 or Ondorengo=Pos_Luzera_Bikoteak.Lortu_Posizioa(Lag)+Azkenaren_Luzera-1 then
                     Buka1:=True;
                     Pos_Luzera_Bikoteak.Lortu_Luzera(Ondorengo_Bikote,
                        O_Luz);
                     Am:=Am+O_Luz-1;
                  end if;
               end if;
            end loop;
         else
            Am:=Am+Azkenaren_Luzera-1;
         end if;
      end if;
   end Tiaren_Has_Am_Bilatu;



end Posizio_Taula;