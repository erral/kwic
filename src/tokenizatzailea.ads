with Ada.Text_Io;
package Tokenizatzailea is

   ------------------ Hurrengo_Tokena_Lortu --------------------------
   -- Sarrera: 
   --   - F testu-fitxategia, irakurtzeko moduan irekia, eta
   --     kutsorea lerro-amaiera batean ez dagoela

   -- Irteera:
   --   - F testu-fitxategia (litekeena da kurtsorea aurrerago egotea)  
   --   - Tokena string-a, F-ko lerro bereko hurrengo tokena
   --     daukana (tokena: karaktere-multzo batekoak diren karaktereez
   --     osaturiko segida)   
   --   - L zenbaki arrunta, Tokena string-aren luzera adierazten
   --     duela  
   --   - Hitz_Motakoa boolearra: True, tokeneko karaktereak
   --     hitz-karakteretzat hartukakoen artekoak baldin badira
   --     (letrak, digituak, marratxoa, azpimarra); False, bestela

   -- Eragina: F-ko hurrengo tokena eta bere luzera lortzen ditu 
   --     fitxategiko kurtsorea dagoen lerro beretik, eta Tokena-n eta 
   --     L-n itzultzen ditu, hurrenez hurren. Halaber, lortutako
   --     tokena hitz motakoa den ala ez ere adierazten du, 
   --     Hitz_Motakoa boolearraren bitartez

   -- Salbuespenak:
   --   - Lerro_Amaia: prozedurari deitzen zaionean altxatuko da,
   --     F-ko kurtsorea lerro-amaiera batean baldin badago
   --   - Modu_Desegokia: fitxategia ez badago In-File moduan irekita
   --     altxatuko da
   --   - Egoera_Desegokia: fitxategia ez badago irekita altxatuko da
   
   -- N.B.: bi motako tokenak besterik ez daude: hitz motakoak direnak
   --     eta hitz motakoak ez direnak (bereizleak)
   
   procedure Hurrengo_Tokena_Lortu (
         F            : in out Ada.Text_Io.File_Type; 
         Tokena       :    out String;                
         L            :    out Natural;               
         Hitz_Motakoa :    out Boolean                );

   
   Lerro_Amaia, Modu_Desegokia, Egoera_Desegokia: exception;
   
end Tokenizatzailea;
