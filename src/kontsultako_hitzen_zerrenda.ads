with Hitzak;
package Kontsultako_Hitzen_Zerrenda is

   Lekurik_Ez, Hutsik_Dago: exception;

   procedure Eraiki ;

   procedure Hurrengo_Hitza_Lortu (H: out Hitzak.Hitz);

   procedure Hitza_kendu;

   function Hutsa_Da return Boolean;


end Kontsultako_Hitzen_Zerrenda;